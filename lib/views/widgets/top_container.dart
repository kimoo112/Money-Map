import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view%20model/google%20auth%20cubit/google_auth_cubit.dart';

import '../../Helpers/colors.dart';
import '../../Helpers/images.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: cNavy,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70.r), // Adjust the value as needed
          bottomRight: Radius.circular(70.r), // Adjust the value as needed
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(left: -20, child: Image.asset(Assets.iconsVectors)),
          Positioned(
              top: 0,
              right: -140,
              bottom: 0,
              child: Image.asset(Assets.iconsVectors)),
          Padding(
            padding: EdgeInsets.only(top: 40.0.sp, left: 10.sp, right: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hello Safe Spender',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: cWhite,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      FirebaseAuth.instance.currentUser?.displayName
                              .toString() ??
                          'No name',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: cBlue,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                BlocBuilder<GoogleAuthCubit, GoogleAuthState>(
                  builder: (context, state) {
                    if (state is GoogleAuthLoading) {
                      return const CircularProgressIndicator();
                    } else {}
                    return IconButton(
                      onPressed: () {
                        BlocProvider.of<GoogleAuthCubit>(context)
                            .signout(context);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: cBlue,
                        size: 18.sp,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
