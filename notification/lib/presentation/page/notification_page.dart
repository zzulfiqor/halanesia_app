import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/notification_controller.dart';
import 'package:notification/presentation/widget/notification_item.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          "Notifikasi",
          style: header.copyWith(color: black),
        ),
        backgroundColor: white,
        iconTheme: const IconThemeData(color: black),
      ),

      // Body
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                var data = controller.notificationList
                    .where(
                        (element) => element.type == controller.selectedFilter)
                    .toList();

                return controller.notificationLoading
                    ? loadingCircle()
                    : data.isEmpty
                        ? Center(
                            child: Text(
                              "Saat ini tidak ada notifikasi",
                              style: bodyText.copyWith(
                                color: darkGrey,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            itemCount: data.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  // FIlter
                                  index == 0
                                      ? Obx(
                                          () => Row(
                                            children: ["User", "Merchant"]
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12),
                                                      child: GestureDetector(
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              border:
                                                                  Border.all(
                                                                color: controller
                                                                            .selectedFilter !=
                                                                        e
                                                                    ? neutralGrey
                                                                    : secondary,
                                                                width: 2,
                                                              ),
                                                              color: white,
                                                            ),
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 12,
                                                                    top: 8),
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 16,
                                                              vertical: 4,
                                                            ),
                                                            child: Text(
                                                              e,
                                                              style: bodyText
                                                                  .copyWith(
                                                                color: controller
                                                                            .selectedFilter !=
                                                                        e
                                                                    ? neutralGrey
                                                                    : secondary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )),
                                                        onTap: () {
                                                          controller
                                                              .selectFilter(e);
                                                        },
                                                      ),
                                                    ))
                                                .toList(),
                                          ),
                                        )
                                      : const SizedBox(),

                                  // Notification Item
                                  NotificationItem(
                                    data: data[index],
                                  ),
                                ],
                              );
                            }),
                          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
