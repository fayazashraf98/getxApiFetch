import 'package:e_shoping/Components/textformfiends.dart';
import 'package:e_shoping/Controllers/Auth_Controller.dart';
import 'package:e_shoping/Views/Signup_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';
import '../Components/Button_Main.dart';
import '../Components/PasswordTextFormFields.dart';

class LoginUser extends StatelessWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailCtr = TextEditingController();
    final passwordCtr = TextEditingController();
    final authController = Get.put(AuthController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 446,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Login_image/login.png'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 435),
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Color(0xffF4F5F9),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Welcome back !',
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
                            'Sign in to your account',
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
                      Form(child: Builder(
                        builder: (context) {
                          return Column(children: [
                            textfield('Email', Icons.email, emailCtr,
                                TextInputType.emailAddress, validateEmail),
                            const SizedBox(
                              height: 10,
                            ),
                            Passwordtextfield(
                                'Password',
                                Icons.lock,
                                Icons.visibility,
                                passwordCtr,
                                validatePassword),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Switcher(
                                  value: false,
                                  colorOff: Colors.grey.withOpacity(0.3),
                                  colorOn: Colors.green,
                                  onChanged: (bool state) {},
                                  size: SwitcherSize.small,
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                      color: Color(0xff868889), fontSize: 15),
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Forgot password",
                                      style: TextStyle(
                                          color: Color(0xff407EC7),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            GestureDetector(onTap: () async {
                              if (Form.of(context)?.validate() ?? false) {
                                await authController.login(emailCtr.text.trim(),
                                    passwordCtr.text.trim());
                              }
                            }, child: Obx(() {
                              return authController.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: Color(0xff6CC51D),
                                    )
                                  : ButtonMain('Login');
                            })),
                            Row(
                              children: [
                                const Text(
                                  'Don’t have an account ?',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff868889)),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Get.off(SignUp());
                                  },
                                  child: const Text('Signup'),
                                )
                              ],
                            ),
                          ]);
                        },
                      )),
                    ]),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
