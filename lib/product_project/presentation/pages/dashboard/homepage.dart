import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_text/marquee_text.dart';
import 'package:norq/product_project/presentation/manager/controller/auth_cntlr.dart';
import 'package:norq/product_project/presentation/manager/controller/cart_cntlr.dart';
import 'package:norq/product_project/presentation/widgets/home_page/product_view.dart';

import '../../routes/app_pages.dart';
import '../../themes/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final cartController = Get.put(CartCntlr());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 80 + 80),
        child: Stack(
          children: <Widget>[
            Container(
              // Background
              color: Colors.black,
              height: 50 + 75,
              width: MediaQuery.of(context).size.width, // Background
              child: const Center(
                child: Text(
                  "NorQ ",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),

            Container(), // Required some widget in between to float AppBar

            Positioned(
              // To take AppBar Size only
              top: 100.0,
              left: 20.0,
              right: 20.0,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                primary: false,
                title: const TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Stack(
                    children: [
                      const Icon(Icons.shopping_cart),
                      Positioned(
                        right: 0,
                        child: Obx(
                          () {
                            if (cartController.cartList.isEmpty) {
                              return const SizedBox();
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.red,
                                ),
                                constraints: const BoxConstraints(
                                  minHeight: 12,
                                  minWidth: 12,
                                ),
                                child: Center(
                                  child: Text(
                                    "${cartController.cartList.length} ",
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: h * 0.05,
          ),
          const ProductViewMenu(),
        ],
      ),
    ));
  }
}
