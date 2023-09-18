import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Helpers/colors.dart';
import '../../Helpers/images.dart';
import '../../view%20model/cubit/google_auth_cubit.dart';
import '../widgets/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login With Google',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
              builder: (context, state) {
                if (state is GoogleAuthLoading) {
                  return const CircularProgressIndicator();
                } else if (state is GoogleAuthFailure) {
                  return SnackBar(content: Text(state.errorMsg.toString()));
                  // Text(state.errorMsg.toString());
                } else if (state is GoogleAuthSuccess) {
                } else {}
                return CustomButton(
                    onTap: () {
                      BlocProvider.of<GoogleAuthCubit>(context)
                          .signInWithGoogle(context);
                    },
                    bcColor: cGrey,
                    title: Image.asset(Assets.iconsGoogleIcon));
              },
            ),
          ],
        ),
      ),
    );
  }
}

snackBar(errMsg) {
  SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'On Snap!',
      message:
          errMsg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}
