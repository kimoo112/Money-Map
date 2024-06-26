import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';

import '../../Helpers/colors.dart';
import '../../view model/google auth cubit/google_auth_cubit.dart';
import '../../view model/profile image cubit/profile_image_cubit.dart';
import '../widgets/all_profile_list_tiles.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileImageCubit>(context).loadImage();
  }

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
                      color: Theme.of(context).primaryColor.withOpacity(.9),
                    ),
                  ),
                  _profilePicture(context),
                  _logoutButton(context),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            _nameAndEmail(context),
            SizedBox(
              height: 20.h,
            ),
            const AllProfileListTiles(),
          ],
        ),
      ),
    );
  }

  Column _nameAndEmail(context) {
    return Column(
      children: [
        Text("${FirebaseAuth.instance.currentUser?.displayName}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
        Text("@${FirebaseAuth.instance.currentUser?.email}",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Theme.of(context).primaryColor)),
      ],
    );
  }

  Positioned _profilePicture(context) {
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
        child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
          builder: (context, state) {
            String image =
                BlocProvider.of<ProfileImageCubit>(context).imagePath;

            return Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  minRadius: 60,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: image != ''
                        ? FileImage(File(image)) as ImageProvider
                        : NetworkImage(
                            '${FirebaseAuth.instance.currentUser?.photoURL}'),
                    minRadius: 55,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: const CircleBorder(),
                  mini: true,
                  onPressed: () {
                    BlocProvider.of<ProfileImageCubit>(context)
                        .pickImageFromGallery();
                  },
                  child: Icon(
                    Ionicons.add_circle_outline,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ],
            );
          },
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
