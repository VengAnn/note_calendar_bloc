import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:note_schedule_remid_bloc/constants/app_color.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/size_widget.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/simple_text.dart';
import 'package:note_schedule_remid_bloc/presentations/widgets/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool hideShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorWhite,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeCustomWidget.width1percent(context) * 3,
            ),
            child: SizedBox(
              height: SizeCustomWidget.screenHeigth(context),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    "assets/images/logo_login.jpg",
                    width: SizeCustomWidget.width1percent(context) * 60,
                  ),
                  // email
                  TextFormFieldWidget(
                    textEditingController: _emailController,
                    hintText: "email_text".tr(),
                    titleText: "email_text".tr(),
                    icon: Icons.email_outlined,
                  ),
                  TextFormFieldWidget(
                    textEditingController: _passwordController,
                    hintText: "password_text".tr(),
                    titleText: "password_text".tr(),
                    icon: Icons.password_outlined,
                    iconSuffix: hideShowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onTap: () {
                      setState(() {
                        hideShowPassword = !hideShowPassword;
                      });
                    },
                    showIconSuffix: true,
                    obscureText: hideShowPassword ? false : true,
                  ),
                  SizedBox(
                    height: SizeCustomWidget.hiegth5percent(context) / 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("forget");
                        },
                        child: SimpleText(
                          text: "forgot_password_text".tr(),
                          sizeText: SizeCustomWidget.font15(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeCustomWidget.hiegth5percent(context) / 5,
                  ),
                  // btn login
                  InkWell(
                    onTap: () {
                      // go to home page
                      //Get.toNamed(RouteHelper.);
                    },
                    child: Container(
                      width: SizeCustomWidget.width(context),
                      height: SizeCustomWidget.hiegth5percent(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeCustomWidget.radius2percent(context),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            AppColor.colorBlue,
                            AppColor.colorAmber,
                          ],
                        ),
                      ),
                      child: Center(
                        child: SimpleText(text: 'login_text'.tr()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeCustomWidget.hiegth5percent(context) / 5,
                  ),
                  // text if don't have a account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleText(
                        text: 'have_accout_text'.tr(),
                        fontWeight: FontWeight.bold,
                        sizeText: SizeCustomWidget.font20(context) / 1.5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // go to sign up page
                          // Get.toNamed(RouteHelper.getSignUpPage());
                        },
                        child: SimpleText(
                          text: "sign_up_text".tr(),
                          textColor: AppColor.colorBlue,
                          fontWeight: FontWeight.bold,
                          sizeText: SizeCustomWidget.font20(context) / 1.1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeCustomWidget.hiegth5percent(context) / 5,
                  ),
                  // login with google account
                  InkWell(
                    onTap: () async {
                      // UserCredential? userCredential =
                      //     await AuthService.signInWithGoogle();
                      // if (userCredential != null) {
                      //   log('Sign-in successful: ${userCredential.user}');
                      //   //Get.toNamed(RouteHelper.getCalenderPage());
                      // }
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                        SizeCustomWidget.width1percent(context) * 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeCustomWidget.radius1percent(context) * 5,
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.asset(
                        "assets/images/google.png",
                        width: SizeCustomWidget.width1percent(context) * 10,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
