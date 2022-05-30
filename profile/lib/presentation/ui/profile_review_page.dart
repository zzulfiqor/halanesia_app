import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controller/profile_review_controller.dart';

class ProfileReviewPage extends GetView<ProfileReviewController> {
  const ProfileReviewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.title.value,
          style: const TextStyle(color: black),
        ),
        iconTheme: const IconThemeData(
          color: black
        ),
        backgroundColor: white,
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Obx(() =>
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                        MediaQuery.of(context).size.width /
                          (MediaQuery.of(context) .size.height / 6)),
                  itemCount: controller.options.value.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: controller.options.value[index].isSelected ? secondary : neutralGrey,
                          width: 2.0),
                        borderRadius:
                          BorderRadius.circular(15.0)
                      ),
                      color: Colors.white,
                      elevation: 0,
                      child: InkWell(
                        splashColor: secondary,
                        onTap: () {
                          controller.setOption(index);
                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              controller.options.value[index].title,
                              style: title2.copyWith(
                                color: controller.options.value[index].isSelected ? secondary : neutralGrey)
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Expanded(
              //   child: LazyLoadScrollView(
              //     onEndOfPage: () async {
              //       await controller.loadMore();
              //     },
              //     isLoading: controller.lastPage,
              //     child: 
              //       controller.isFirstLoad
              //       ? loadingCircle()
              //       : Padding(
              //         padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              //         child: ListView.builder(
              //           scrollDirection: Axis.vertical,
              //           shrinkWrap: true,
              //           itemCount: 10,
              //           physics: const BouncingScrollPhysics(),
              //           itemBuilder: (BuildContext context, int index) {
              //             return Container(
              //               width: double.infinity,
              //               margin: const EdgeInsets.only(top: 14),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       // loadImageProfile(data[index].userImage ?? "", 25),
              //                       loadImageProfile( "", 25),
              //                       const SizedBox(width: 10),
              //                       Expanded(
              //                         child: Text(
              //                           // data[index].userName ?? "no name",
              //                           "no name",
              //                           style: info1.copyWith(color: basic),
              //                         ),
              //                       ),
              //                       const SizedBox(width: 10),
              //                       InkWell(
              //                         onTap: (){
              //                           // onReport!(data[index]);
              //                         },
              //                         child: const Icon(Icons.more_vert,
              //                           size: 20, 
              //                           color: black
              //                         )
              //                       )
              //                     ],
              //                   ),
              //                   const SizedBox(height: 10),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       const Icon(Icons.star_rate_rounded,
              //                         size: 16,
              //                         color: star
              //                       ),
              //                       const SizedBox(width: 5),
              //                       Text(
              //                         // "${data[index].rate}/5",
              //                         "3/5",
              //                         style: info1.copyWith(color: basic)
              //                       ),
              //                     ],
              //                   ),
              //                   const SizedBox(height: 10),
              //                   SizedBox(
              //                     width: double.infinity,
              //                     child: Text(
              //                       // data[index].comment!.isNotEmpty 
              //                       // ? data[index].comment!
              //                       // : 
              //                       "Tidak ada komentar",
              //                       style: bodyText.copyWith(color: 
              //                       // data[index].comment!.isNotEmpty ? 
              //                       basic
              //                       //  : neutralGrey
              //                       )
              //                     ),
              //                   ),
              //                   // data[index].productImage!.isNotEmpty 
              //                   // ? Padding(
              //                   //   padding: const EdgeInsets.only(top: 10),
              //                   //   child: SizedBox(
              //                   //     height: 70,
              //                   //     child: ListView.builder(
              //                   //       scrollDirection: Axis.horizontal,
              //                   //       shrinkWrap: true,
              //                   //       itemCount: data[index].productImage!.length,
              //                   //       itemBuilder: (BuildContext context, int i) {
              //                   //         return InkWell(
              //                   //           onTap: (){
              //                   //             Get.toNamed(RouteName.storeProductReviewImage, 
              //                   //               arguments: ReviewImageItem(
              //                   //                 userName: data[index].userName!,
              //                   //                 rate: data[index].rate!,
              //                   //                 comment: data[index].comment!,
              //                   //                 imagePath: data[index].productImage![i]
              //                   //               ).toJson()
              //                   //             );
              //                   //           },
              //                   //           child: Padding(
              //                   //             padding: const EdgeInsets.only(right: 22),
              //                   //             child: Material(
              //                   //               elevation: 5,
              //                   //               borderRadius: const BorderRadius.all(Radius.circular(8)), 
              //                   //               child: ClipRRect(
              //                   //                 borderRadius: const BorderRadius.all(Radius.circular(8)),
              //                   //                 child: loadImageSquare(data[index].productImage?[i] ?? "", 70)
              //                   //               )
              //                   //             ),
              //                   //           ),
              //                   //         );
              //                   //       },
              //                   //     ),
              //                   //   )
              //                   // ): Container(),
              //                   const SizedBox(height: 10),
              //                   const Divider(
              //                     color: neutralGrey
              //                   )
              //                 ],
              //               ),
              //             );
              //           },
              //         )
              //         // ReviewList(
              //         //   data: controller.review,
              //         //   onImageTap: (value){
              //         //     Get.toNamed(RouteName.storeProductReviewImage);
              //         //   },
              //         //   isDetail: true,
              //         //   onReport: (value){
              //         //     showReviewReport(value);
              //         //   },
              //         // ),
              //       ),
              //   )
              // )
            ],
          ),
        ),
      )
    );
  }
}