import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../manager/controller/auth_cntlr.dart';
import '../../routes/app_pages.dart';
import '../../themes/app_colors.dart';
import '../../widgets/custom/custom_gradient_button.dart';
import '../../widgets/custom/custom_label_text_Filed.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final authController = Get.find<AuthCntlr>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black,
                        Colors.black,
                        Colors.black,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      w * 0.05,
                      h * 0.01,
                      w * 0.05,
                      h * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello",
                                  style: GoogleFonts.lora(
                                      color: AppColors.white,
                                      fontSize: w * 0.1,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: h * 0.005,
                                ),
                                Text(
                                  "Sign in!",
                                  style: GoogleFonts.lora(
                                      color: AppColors.white,
                                      fontSize: w * 0.12,
                                      fontWeight: FontWeight.bold),
                                ),SizedBox(
                                  height: h * 0.005,
                                ),
                                Text(
                                  "NorQ ",
                                  style: GoogleFonts.lora(
                                      color: AppColors.white,
                                      fontSize: w * 0.12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: h * 0.65,
                    width: w,
                    padding: EdgeInsets.fromLTRB(
                      w * 0.05,
                      h * 0.05,
                      w * 0.05,
                      h * 0.05,
                    ),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                    child: SingleChildScrollView(
                      child: Form(
                        key: authController.signInGlobalKey,
                        child: AutofillGroup(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelCustomTextField(
                                autofillHints: const [AutofillHints.username],
                                hintText: "enter your E-mail",
                                textFieldLabel: "E-Mail",
                                controller: authController.signInMailController,
                                textFieldLabelColor:
                                    Colors.black,
                                validator: (p0) {
                                  final emailRegex = RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                                  if (!emailRegex.hasMatch(p0)) {
                                    return 'Enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              LabelCustomTextField(
                                hintText: "enter your Password",
                                passwordfield: true,
                                controller:
                                    authController.signInPasswordController,
                                textFieldLabel: "Password",
                                textFieldLabelColor:
                                    Colors.black,
                                validator: (p0) {
                                  if (p0.isEmpty) {
                                    return "enter your password";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Obx(
                                    () => authController.isSignInLoading.value
                                        ? SizedBox(
                                            height: h * 0.045,
                                            width: w * 0.1,
                                            child: const CircularProgressIndicator(),
                                          )
                                        : CustomGradientButton(
                                            title: "Sign in",
                                            onPressed: () {
                                              authController.signIn(
                                                  authController
                                                      .signInMailController
                                                      .text,
                                                  authController
                                                      .signInPasswordController
                                                      .text);
                                            },
                                      buttonSColor: Colors.black,
                                      buttonFColor: Colors.black,
                                      buttonTColor: Colors.black,
                                    ),
                                  )),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppPages.signUp);
                                    },
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Don't have an account?",
                                          style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Sign UP",
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
