// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:incomeandexpense/Helpers/navigate.dart';
import 'package:incomeandexpense/view%20model/transaction%20cubit/the_transaction_cubit.dart';
import 'package:incomeandexpense/views/screens/base_screen.dart';
import 'package:incomeandexpense/views/screens/login_view.dart';
import 'package:meta/meta.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());
  final user = FirebaseAuth.instance;
  Future signInWithGoogle(context) async {
    try {
      emit(GoogleAuthLoading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(GoogleAuthFailure(errorMsg: 'You Should Choose An Account'));
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(GoogleAuthSuccess());
      navigateToPR(const BaseScreen(), context);
    } on FirebaseAuthException catch (e) {
      emit(GoogleAuthFailure(errorMsg: e.message ?? "An error occurred"));
    } on Exception catch (e) {
      emit(GoogleAuthFailure(errorMsg: e.toString()));
    }
  }

  signout(context) {
    emit(GoogleAuthLoading());

    GoogleSignIn().disconnect();
    user.signOut();
    BlocProvider.of<TheTransactionsCubit>(context).removeBox();
    BlocProvider.of<TheTransactionsCubit>(context).deleteImage();

    emit(GoogleAuthSuccess());

    navigateToPR(const LoginView(), context);
  }
}
