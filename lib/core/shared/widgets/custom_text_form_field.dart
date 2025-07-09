import 'package:clean_arch_app/core/resources/app_strings.dart';
import 'package:clean_arch_app/core/resources/image_path.dart';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomTextFormField extends StatefulWidget {
  final String hint;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final bool obsecure;
  final bool fill;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isEmail;
  final bool? isName;
  final bool? isRequired;
  final bool? isPassword;
  final bool? isConfirmpass;
  final RegExp? emailRegex;
  final TextEditingController? pass;
  final bool? isLogin;
  final String? errorText;
  final Function(String)? onChanged;
  final int? maxLines;
  final Widget? endWidget;
  final void Function()? onPressField;
  final bool isDate;
  final bool isDense;
  final FocusNode? focusNode;
  final TextStyle? style;     
  final EdgeInsets? contentPadding;

  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.hintStyle,
      this.obsecure = false,
      this.fill = true,
      this.prefixIcon,
      this.suffixIcon,
      this.isRequired = false,
      this.isName = false,
      this.isEmail = false,
      this.emailRegex,
      this.isPassword = false,
      this.isConfirmpass = false,
      this.pass,
      required this.controller,
      this.isLogin = false,
      this.errorText,
      this.onChanged,
      this.maxLines = 1,
      this.endWidget,
      this.onPressField,
      this.isDate = false,
      this.isDense = false,
      this.focusNode,
      this.style,
      this.contentPadding});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressField,
      child: TextFormField(
        focusNode: widget.focusNode,
        // showCursor: widget.onPressField != null ? true : false,
        readOnly: widget.onPressField != null ? true : false,
        onTap: widget.onPressField,
        style: widget.isDate
            ? GoogleFonts.inter(
                fontSize: AppFonts.Size12,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlue,
              )
            : widget.style,
        // enabled: widget.onPressField == null ? true : false,
        controller: widget.controller,
        maxLines: widget.maxLines!,
        decoration: InputDecoration(
          filled: widget.isDate ? false : true,
          fillColor: AppColors.whiteColor,
          errorText: widget.errorText,
          errorMaxLines: 2,
          // prefixIcon: Icon(widget.prefixIcon),
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              GoogleFonts.inter(
                fontSize: AppFonts.Size14,
                fontWeight: FontWeight.w400,
                color: AppColors.lightGreyColor,
              ),
          // filled: widget.fill,
          isDense: widget.isDense,
          suffixIcon: widget.isPassword! || widget.isConfirmpass!
              ? IconButton(
                  onPressed: () {
                    obsecure = !obsecure;
                    setState(() {});
                    // if (widget.onPressedSuffix != null) {
                    //   widget.onPressedSuffix!();
                    // }
                  },
                  // widget.suffixIcon ??
                  icon: SvgPicture.asset(
                    (obsecure ? ImagesPath.eyeIcon : ImagesPath.closeEyeIcon),
                    width: appWidth(context: context, w: 19.7),
                    height: appHeight(context: context, h: 12.07),
                  ))
              : widget.endWidget,
          border: widget.isDate
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.lightGreyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
          contentPadding: widget.isDate
              ? EdgeInsets.symmetric(
                  horizontal: appWidth(context: context, w: 8),
                  vertical: appHeight(context: context, h: 4),
                )
              : widget.contentPadding ?? EdgeInsets.only(
                  left: 15,
                  right: 0,
                  top: !widget.isDate ? 15 : 20,
                  bottom: 15),
          counterText: '',
          enabledBorder: widget.isDate
              ? null
              : OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.lightGreyColor),
                  borderRadius: BorderRadius.circular(8)),
          focusedBorder: widget.isDate
              ? null
              : OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
        ),
        maxLength: widget.isEmail!
            ? 50
            : widget.isName!
                ? 40
                : null,
        obscureText:
            widget.isPassword! || widget.isConfirmpass! ? obsecure : false,
        onChanged: widget.isLogin!
            ? (value) {
                widget.onChanged!(value);
              }
            : null,
        validator: (value) {
          if (widget.isRequired! && value!.isEmpty) {
            return AppStrings(context: context).required_field;
          }
          if (widget.isEmail! &&
              !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                  .hasMatch(value!)) {
            return AppStrings(context: context).enter_a_vaild_email;
          }
          if (widget.isPassword! &&
              value!.length <= 8 &&
              widget.isLogin! == false) {
            return AppStrings(context: context)
                .password_must_be_more_than_8_characters;
          }
          if (widget.isPassword! &&
              !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^a-zA-Z\d\s]).{8,}$')
                  .hasMatch(value!) &&
              widget.isLogin! == false) {
            return AppStrings(context: context)
                .password_must_have_upercase_and_lower_case_and_numbers_and_special_charcters;
          }
          if (widget.isConfirmpass! && widget.pass!.text != value) {
            return AppStrings(context: context).password_do_not_match;
          }
          return null;
        },
      ),
    );
  }
}
