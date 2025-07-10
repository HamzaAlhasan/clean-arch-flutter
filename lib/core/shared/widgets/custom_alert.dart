import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlert extends StatefulWidget {
  final String title;
  final String actionText;
  const CustomAlert({super.key, required this.title, required this.actionText});

  @override
  State<CustomAlert> createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            title: Text(
              widget.title,
            style: GoogleFonts.inter(
                color: AppColors.blackColor,
                fontSize: respovsiveFontSize(context: context, f: AppFonts.Size18),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: InkWell(
                onTap: () {Navigator.pop(context);},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.blueColor),
                      borderRadius: BorderRadius.circular(22),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(53, 155, 188, 1),
                        Color.fromRGBO(27, 92, 153, 1)
                      ])),
                  child: MaterialButton(
                    onPressed: null,
                    minWidth: appWidth(context: context, w: 97),
                    child: Text(
                      widget.actionText,
                      style: GoogleFonts.inter(
                          color: AppColors.whiteColor,
                          fontSize: respovsiveFontSize(
                              context: context, f: AppFonts.Size16),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                            ),
              ),
            ],
          );
  }
}