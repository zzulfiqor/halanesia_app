import 'package:core/core.dart';
import 'package:core/ui/unknown_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/controller/home_controller.dart';
import 'package:home/presentation/page/main_page.dart';
import 'package:profile/presentation/controller/profile_controller.dart';
import 'package:profile/presentation/ui/profile_page.dart';
import 'package:transaction/controller/transaction_controller.dart';
import 'package:transaction/presentation/page/transaction_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.onPressBack(),
      child: Scaffold(
        // body
        body: Obx(
          () {
            switch (controller.bottomNavbarIndex) {
              case 0:
                return const MainPage();
              case 1:
                return Scaffold(
                  body: Container(),
                );
              case 2:
                return const TransactionPage();
              case 3:
                return const ProfilePage();
              default:
                return const UnknownPage();
            }
          },
        ),

        // Bottom Navigation
        bottomNavigationBar: Obx(
          () => Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 12,
              backgroundColor: white,
              currentIndex: controller.bottomNavbarIndex,
              onTap: (index) {
                controller.setBottomNavbarIndex(index);

                if (index == 2) {
                  Get.find<TransactionController>().getTransactionItem();
                  return;
                }

                if (index == 3) {
                  Get.find<ProfileController>().getProfile();
                  return;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/ic_bottomnavbar_home_inactive.png',
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/ic_bottomnavbar_home_active.png',
                    height: 24,
                  ),
                  label: "Utama",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/ic_bottomnavbar_chat_inactive.png',
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/chat.png',
                    height: 24,
                  ),
                  label: "Pesan",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/ic_bottomnavbar_transaction_inactive.png',
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/ic_bottomnavbar_transaction_active.png',
                    height: 24,
                  ),
                  label: "Transaksi",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/ic_bottomnavbar_profile_inactive.png',
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/images/ic_bottomnavbar_profile_active.png',
                    height: 24,
                  ),
                  label: "Akun",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
