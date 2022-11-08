import 'package:e_shoping/Controllers/Auth_Controller.dart';
import 'package:e_shoping/Views/Login_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Components/SliderImages.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.offAll(LoginUser());
                      },
                      icon: Icon(Icons.logout))

                  // Icon(
                  //   Icons.menu,
                  //   size: 30,
                  //   color: Color(0xff6CC51D),
                  // )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffF4F5F9),
                        borderRadius: BorderRadius.circular(5)),
                    child: const TextField(
                      // onChanged: onSearch,
                      // controller: searchField,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: "Search keywords..",
                          hintStyle: TextStyle(
                              color: Color(0xff868889), fontSize: 15)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndex = index),
                  ),
                  itemCount: sliderImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = sliderImages[index];
                    return buildImage(urlImage, index);
                  }),
              Positioned(
                top: 130,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildIndicator(),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff868889),
              )
            ],
          ),
          Expanded(child: Obx(() {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: authController.category.length,
                itemBuilder: (BuildContext context, int index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 3, right: 3, top: 10),
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: Colors.red,
                              child: ClipOval(
                                  child: Text(
                                    
                                      authController.category[index].title ??
                                          'error')),
                            ))
                      ],
                    ));
          })),
        ]),
      ),
    ));
  }
}
