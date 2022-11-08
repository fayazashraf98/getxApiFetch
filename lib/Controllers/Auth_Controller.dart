import 'package:e_shoping/Models/Categories_Response.dart';
import 'package:e_shoping/Models/Login_Response.dart';
import 'package:e_shoping/Models/Signout_Response.dart';
import 'package:e_shoping/Services/Categories_Service.dart';
import 'package:e_shoping/Services/Login_Service.dart';
import 'package:e_shoping/Services/Signout_Service.dart';
import 'package:e_shoping/Views/Dashboard_View.dart';
import 'package:e_shoping/Views/Login_View.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Signout_Response.dart';
import '../Models/Signup_Response.dart';
import '../Services/Signup_Service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  var isLoading = true.obs;
  late Rx<SignupData>? signupData;
  late Rx<LoginData>? loginData;
  late Rx<SignoutData>? signoutData;
// RxList<CategoriesData> category = (List<CategoriesData>.of([])).obs;
  var category = <CategoriesData>[].obs;
  //RxList<CategoriesData> category = <CategoriesData>[].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    signupData = Get.put(Rx(SignupData()));
    loginData = Get.put(Rx(LoginData()));
    category = Get.put(RxList(<CategoriesData>[]));

    //Category=Get.put(RxList([List<CategoriesData> category = const []]))
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categoriesFetch();
  }

  Future categoriesFetch() async {
    try {
      var response = await CategoryService.CategoryFetch();
      category.value = response.data!;
    } finally {}
  }

  Future signup(String emailCtr, String phoneCtr, String PasswordCtr) async {
    try {
      isLoading(true);
      var response =
          await SignupService.signupUser(emailCtr, phoneCtr, PasswordCtr);
      if (response != null) {
        signupData?.value = response.data!;
        categoriesFetch();
        print(response.statusCode);
        Get.snackbar(
          "Signup",
          'User Created successfully',
          backgroundColor: Colors.greenAccent,
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAll(Dashboard());
      }
    } catch (e) {
      if (SignupData().email == SignupData().email) {
        Get.snackbar("user already exists",
            "this email address is registered with another account",
            colorText: Colors.white,
            backgroundColor: Colors.redAccent,
            icon: const Icon(
              Icons.error,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading(false);
    }
  }

  Future login(String emailCtr, String PasswordCtr) async {
    try {
      isLoading(true);
      var response = await LoginServices.LoginUser(emailCtr, PasswordCtr);
      if (response != null) {
        loginData?.value = response.data;
        categoriesFetch();
        print(response.statusCode);
        Get.snackbar(
          'Login Successfully',
          "Welcome back",
          backgroundColor: Colors.greenAccent,
          icon: const Icon(
            Icons.login,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAll(Dashboard());
      }
    } catch (e) {
      if (LoginData().email != emailCtr &&
          LoginData().password != PasswordCtr) {
        Get.snackbar('Login Faild!!', "Login username or Password incorrect!!",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(
              Icons.error,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.BOTTOM);
      }
    } finally {
      isLoading(false);
    }
  }

  Future signout() async {
    try {
      var response = await SignoutServices.SignoutUser(
          SignoutData().accessToken.toString());
      if (signupData != null) {
        SignoutData().accessToken == null;
        Get.offAll(LoginUser());
        Get.snackbar(
          'Signout',
          "signout user Successfully",
          backgroundColor: Colors.greenAccent,
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        "some thing wrong please try agian",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Future categoriesListFetch() async {
  //   try {
  //     var response = await CategoriesService().FetchCategorie();
  //     if (categoriesList != null) {
  //       categoriesList.value = response.data!;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
