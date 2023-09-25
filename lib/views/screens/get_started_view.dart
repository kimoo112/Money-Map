import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Helpers/images.dart';
import '../../Helpers/size.dart';
import '../widgets/custom_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _customContainer(context),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  Text(
                    "Money Map",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    " Illuminate your financial path, charting incomes and spends seamlessly",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                bcColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          _getStartedImage(),
        ],
      ),
    );
  }

  Positioned _getStartedImage() {
    return Positioned(
        top: 0,
        bottom: 150,
        right: 0,
        left: 0,
        child: Image.asset(
          Assets.imagesGetStarted,
          width: 150.w,
        ));
  }

  ClipPath _customContainer(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(.8),
        height: kHieght(context) * .75,
      ),
    );
  }
}
