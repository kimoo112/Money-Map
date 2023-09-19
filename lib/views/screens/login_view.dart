import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/images.dart';
import '../../view model/google auth cubit/google_auth_cubit.dart';
import '../widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'On Snap!',
      message:
          'This is an example error message that will be shown in the body of snackbar!',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );

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
            BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
              listener: (context, state) {
                if (state is GoogleAuthFailure) {
                  showSnackBar(context, state.errorMsg, ContentType.failure);
                } else if (state is GoogleAuthSuccess) {
                  showSnackBar(
                      context, 'Login Successfuly Done', ContentType.success);
                }
              },
              builder: (context, state) {
                if (state is GoogleAuthLoading) {
                  return const CircularProgressIndicator();
                } else {}
                return CustomButton(
                    onTap: () {
                      BlocProvider.of<GoogleAuthCubit>(context)
                          .signInWithGoogle(context);
                    },
                    bcColor: cGrey,
                    title: _customButtonTitle());
              },
            )
          ],
        ),
      ),
    );
  }

  Row _customButtonTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.iconsGoogleIcon),
        SizedBox(width: 10.w),
        const Text(
          'Login Here',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: cWhite),
        ),
      ],
    );
  }
}

void showSnackBar(BuildContext context, String errMsg, ContentType type) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'On Snap!',
      message: errMsg,
      contentType: type,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
