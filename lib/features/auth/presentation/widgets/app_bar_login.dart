import 'package:clean_arch_app/core/resources/image_path.dart';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarLogin extends StatelessWidget {
  const AppBarLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: appWidth(context: context, w: 21.26)),
      width: widthScreen,
      height: heightScreen / 2,
      color: AppColors.darkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: appHeight(context: context, h: 27.34),
          ),
          SvgPicture.asset(ImagesPath.logoIcon),
          SizedBox(
            height: appHeight(context: context, h: 10),
          ),
          SvgPicture.asset(ImagesPath.attendanceTracking)
        ],
      ),
    );
  }
}
