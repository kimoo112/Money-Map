import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../Helpers/colors.dart';
import '../../view%20model/google%20auth%20cubit/google_auth_cubit.dart';

import '../widgets/all_profile_list_tiles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 240.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 210.h,
                      color: cBlue.withOpacity(.9),
                    ),
                  ),
                  _profilePicture(),
                  _logoutButton(context),
                ],
              ),
            ),
            _nameAndEmail(),
            SizedBox(
              height: 20.h,
            ),
            const AllProfileListTiles(),
          ],
        ),
      ),
    );
  }

  Column _nameAndEmail() {
    return Column(
      children: [
        Text("${FirebaseAuth.instance.currentUser?.displayName}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
        Text("@${FirebaseAuth.instance.currentUser?.email}",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14.sp, color: cBlue)),
      ],
    );
  }

  Positioned _profilePicture() {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(60), boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: cLightGrey.withOpacity(.4),
            blurRadius: 7,
            spreadRadius: .7,
          ),
        ]),
        child: CircleAvatar(
          minRadius: 60,
          backgroundColor: cWhite,
          child: CircleAvatar(
            backgroundColor: cBlue,
            backgroundImage:
                NetworkImage('${FirebaseAuth.instance.currentUser?.photoURL}'),
            minRadius: 55,
          ),
        ),
      ),
    );
  }

  Positioned _logoutButton(BuildContext context) {
    return Positioned(
      top: 20.sp,
      left: 0,
      child: IconButton(
        onPressed: () {
          BlocProvider.of<GoogleAuthCubit>(context).signout(context);
        },
        icon: const Icon(
          Iconsax.logout,
          color: cLight,
        ),
      ),
    );
  }
}
