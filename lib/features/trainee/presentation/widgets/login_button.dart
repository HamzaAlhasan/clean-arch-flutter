import 'package:clean_arch_app/core/resources/app_strings.dart';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(53, 155, 188, 1),
              Color.fromRGBO(27, 92, 153, 1),
            ]),
            borderRadius: BorderRadius.circular(50)),
        child: MaterialButton(
          onPressed: null,
          minWidth: appWidth(context: context, w: 304),
          height: appHeight(context: context, h: 50),
          child: Text(
            AppStrings(context: context).login,
            style: GoogleFonts.inter(
              color: AppColors.whiteColor,
              fontSize:
                  respovsiveFontSize(context: context, f: AppFonts.Size14),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
