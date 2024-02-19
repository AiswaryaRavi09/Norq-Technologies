import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norq/product_project/data/remote/modals/response/product_response_modal.dart';
import 'package:norq/product_project/presentation/manager/controller/cart_cntlr.dart';
import 'package:norq/product_project/presentation/routes/app_pages.dart';
import 'package:norq/product_project/presentation/themes/app_colors.dart';
import 'package:norq/product_project/presentation/widgets/custom/custom_gradient_button.dart';
import 'package:norq/product_project/presentation/widgets/custom/custome_alert_dialogue.dart';

class ProductDescriptionPage extends StatelessWidget {
  ProductDescriptionPage({super.key, required this.productResponseModal});

  final ProductResponseModal productResponseModal;
  final cartController = Get.put(CartCntlr());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.sizeOf(context).width;
    double h = MediaQuery.sizeOf(context).height;
    return SafeArea(
        child: Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: h * 0.32,
            width: w,
            child: CachedNetworkImage(
              imageUrl: productResponseModal.image,
              fit: BoxFit.fill,
              placeholder: (context, url) => SizedBox(
                height: h * 0.045,
                width: w * 0.1,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            "Rs:${productResponseModal.price}",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: AppColors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            productResponseModal.title,
            style: GoogleFonts.poppins(
                color: AppColors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            "category : ${productResponseModal.category.name}",
            style: GoogleFonts.poppins(
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Text(
            productResponseModal.description,
            style: GoogleFonts.poppins(
              color: AppColors.black,
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          CustomGradientButton(
            title: "Add to cart",
            onPressed: () {
              if (cartController.cartList
                  .map((element) => element.productResponseModal)
                  .contains(productResponseModal)) {
                customAlertDialogue(
                    title: "",
                    content: "item already in cart",
                    txtbuttonName1: "Back",
                    txtbuttonName2: "view cart",
                    txtbutton2Action: () {
                      Get.toNamed(AppPages.cartPage);
                    },
                    txtbutton1Action: () {
                      Get.back();
                    });
              }
              final subTotal = productResponseModal.price * 1;
              cartController.addToCart(productResponseModal, 1, subTotal);
            },
            buttonSColor: Colors.black,
            buttonFColor: Colors.black,
            buttonTColor: Colors.black,
          ),
        ],
      ),
    ));
  }
}
