import 'package:clean_arch_app/core/resources/app_strings.dart';
import 'package:clean_arch_app/core/resources/image_path.dart';
import 'package:clean_arch_app/core/shared/widgets/custom_text_form_field.dart';
import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/features/auth/presentation/provider/login_provider.dart';
import 'package:clean_arch_app/features/auth/presentation/widgets/app_bar_login.dart';
import 'package:clean_arch_app/features/auth/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.darkBlue,
          body:
              Consumer<LoginProvider>(builder: (context, loginProvider, child) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      const AppBarLogin(),
                      Container(
                        margin: EdgeInsets.only(
                            top: appHeight(context: context, h: 158.17)),
                        padding: EdgeInsets.symmetric(
                            horizontal: appWidth(context: context, w: 37.45)),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22)),
                          color: Color.fromRGBO(249, 250, 252, 1),
                        ),
                        width: widthScreen,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: appHeight(context: context, h: 72.88),
                            ),
                            SvgPicture.asset(
                              ImagesPath.logo,
                              width: appWidth(context: context, w: 73.78),
                              height: appHeight(context: context, h: 126.58),
                            ),
                            SizedBox(
                              height: appHeight(context: context, h: 64.94),
                            ),
                            Form(
                                key: formstate,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: AppStrings(context: context)
                                                  .email,
                                              style: GoogleFonts.inter(
                                                  color: AppColors.deepGrey,
                                                  fontSize: respovsiveFontSize(
                                                      context: context,
                                                      f: AppFonts.Size14),
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                            text: '*',
                                            style: GoogleFonts.inter(
                                              color: AppColors.redColor,
                                              fontSize: respovsiveFontSize(
                                                  context: context,
                                                  f: AppFonts.Size14),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ])),
                                        SizedBox(
                                          height: appHeight(
                                              context: context, h: 10.5),
                                        ),
                                        CustomTextFormField(
                                          hint: AppStrings(context: context)
                                              .email_hint,
                                          controller: emailController,
                                          isEmail: true,
                                          hintStyle: GoogleFonts.inter(
                                              color: AppColors.lightGreyColor,
                                              fontSize: respovsiveFontSize(
                                                  context: context,
                                                  f: AppFonts.Size14),
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          appHeight(context: context, h: 16.5),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: AppStrings(context: context)
                                                  .password,
                                              style: GoogleFonts.inter(
                                                  color: AppColors.deepGrey,
                                                  fontSize: respovsiveFontSize(
                                                      context: context,
                                                      f: AppFonts.Size14),
                                                  fontWeight: FontWeight.w400)),
                                          TextSpan(
                                            text: '*',
                                            style: GoogleFonts.inter(
                                              color: AppColors.redColor,
                                              fontSize: respovsiveFontSize(
                                                  context: context,
                                                  f: AppFonts.Size14),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ])),
                                        SizedBox(
                                          height: appHeight(
                                              context: context, h: 10.5),
                                        ),
                                        CustomTextFormField(
                                          hint: AppStrings(context: context)
                                              .password_hint,
                                          controller: passwordController,
                                          isPassword: true,
                                          hintStyle: GoogleFonts.inter(
                                              color: AppColors.lightGreyColor,
                                              fontSize: respovsiveFontSize(
                                                  context: context,
                                                  f: AppFonts.Size14),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          appHeight(context: context, h: 67),
                                    ),
                                    LoginButton(onTap: () {
                                      if (formstate.currentState!.validate()) {
                                        formstate.currentState!.save();
                                        loginProvider.login(emailController.text, passwordController.text, context);
                                      }
                                    }),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: const Color.fromRGBO(249, 250, 252, 1),
                    height: heightScreen / 9.2,
                  )
                ],
              ),
            );
          })),
    );
  }
}
