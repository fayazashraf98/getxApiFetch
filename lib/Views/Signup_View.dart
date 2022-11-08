import 'package:e_shoping/Components/PasswordTextFormFields.dart';
import 'package:e_shoping/Components/textformfiends.dart';
import 'package:e_shoping/Controllers/Auth_Controller.dart';
import 'package:e_shoping/Views/Login_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/Button_Main.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final emailCtr = TextEditingController();
    final phoCtr = TextEditingController();
    final passCtr = TextEditingController();
    final authController = Get.put(AuthController());

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Welcome"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(children: [
              //image Container
              Container(
                height: 446,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Signup_image/signup.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 435),

                // Signup Form Container
                child: Container(
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Color(0xffF4F5F9),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 17, right: 17, bottom: 17),
                      child: Column(children: [
                        const SizedBox(
                          height: 29,
                        ),
                        Row(
                          children: [
                            Text(
                              'Create account',
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Quickly create account',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff868889),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Form(
                          child: Builder(builder: (context) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    //Email Text Field
                                    textfield(
                                        'Email',
                                        Icons.email,
                                        emailCtr,
                                        TextInputType.emailAddress,
                                        validateEmail),

                                    const SizedBox(
                                      height: 22,
                                    ),

                                    //Phone Number Text Field
                                    textfield(
                                        'Phone Number',
                                        Icons.phone,
                                        phoCtr,
                                        TextInputType.number,
                                        validatePhone),

                                    const SizedBox(
                                      height: 22,
                                    ),

                                    //Passowrd Text Field
                                    Passwordtextfield(
                                        'Password',
                                        Icons.lock,
                                        Icons.visibility,
                                        passCtr,
                                        validatePassword),

                                    const SizedBox(
                                      height: 17,
                                    ),
                                    // Signup Button
                                    GestureDetector(onTap: () async {
                                      if (Form.of(context)?.validate() ??
                                          false) {
                                        await authController.signup(
                                            emailCtr.text.trim(),
                                            phoCtr.text.trim(),
                                            passCtr.text.trim());
                                      }
                                    }, child: Obx(() {
                                      return authController.isLoading.value
                                          ? const CircularProgressIndicator(
                                              color: Color(0xff6CC51D),
                                            )
                                          : ButtonMain('Signup');
                                    })),

                                    //back to login Screen
                                    Row(
                                      children: [
                                        const Text(
                                          'Already have an account ?',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xff868889)),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            // Get.offAll(SignUp());
                                            Get.off(LoginUser());
                                          },
                                          child: const Text('Login'),
                                        )
                                      ],
                                    ),
                                  ],
                                ));
                          }),
                        )
                      ])),
                ),
              ),
            ]),
          ],
        )));
  }
}
