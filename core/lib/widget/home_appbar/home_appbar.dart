import 'package:core/core.dart';
import 'package:core/widget/home_appbar/home_appbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends GetView<HomeAppbarController>
    with PreferredSizeWidget {
  final Function(String?) onSearchChanged;
  final bool usebackButton;
  final int cartCount;
  final Function? onBackTapped;
  const HomeAppBar({
    Key? key,
    required this.onSearchChanged,
    this.usebackButton = false,
    this.cartCount = 0,
    this.onBackTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 5,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (usebackButton)
              Row(
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () => onBackTapped != null
                        ? onBackTapped?.call()
                        : Get.back(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ],
              ),

            // Search bar
            Obx(
              () => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            controller.searchHasFocus() ? secondary : lightGrey,
                        width: 1,
                      ),
                    ),
                    child: FocusScope(
                      onFocusChange: (value) {
                        controller.searchHasFocus.value = value;
                      },
                      child: Stack(
                        children: [
                          // Text Field
                          TextField(
                            controller: controller.searchTextEditingController,
                            maxLines: 1,
                            minLines: 1,
                            onChanged: onSearchChanged,
                            scrollPadding: const EdgeInsets.all(0),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 12),
                              hintText: 'Search',
                              border: InputBorder.none,
                              icon: Image.asset(
                                'assets/images/ic_search.png',
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),

                          // OnTap
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.search);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Action Buttons
            Row(
              children: [
                // Notification
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () async {
                      await Get.toNamed(RouteName.notification);
                      controller.refreshCart();
                    },
                    child: Image.asset(
                      'assets/images/ic_notification.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),

                // Cart
                GestureDetector(
                  onTap: () async {
                    await Get.toNamed(RouteName.cart);
                    controller.refreshCart();
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset(
                          'assets/images/ic_cart.png',
                          height: 24,
                          width: 24,
                        ),
                      ),

                      // if cart not empty
                      Positioned(
                        top: 0,
                        right: 5,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: cartCount == 0
                              ? Container()
                              : cartCount < 100
                                  ? Container(
                                      width: 15,
                                      height: 15,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        cartCount.toString(),
                                        style: subTitle3.copyWith(
                                            color: white, fontSize: 9),
                                      ),
                                    )
                                  : Container(
                                      width: 15,
                                      height: 15,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        "99+",
                                        style: subTitle3.copyWith(
                                            color: white, fontSize: 9),
                                      ),
                                    ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Favorite
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.wishlist);
                      },
                      child: const Icon(Icons.favorite_outline_rounded)),
                ),
              ],
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
