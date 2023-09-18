import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../../Helpers/colors.dart';
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
              const Text(
                "Spend Smarter Save More",
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              const CustomButton(
                bcColor: cBlue,
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
          width: 150,
        ));
  }

  ClipPath _customContainer(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: kHieght(context) * .7,
        color: cBlue.withOpacity(.8),
      ),
    );
  }
}
