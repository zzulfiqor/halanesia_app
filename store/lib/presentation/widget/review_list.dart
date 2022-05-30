import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/data/product_review_image_response.dart';
import 'package:store/data/product_review_response.dart';

class ReviewList extends StatelessWidget {

  final List<ReviewItem> data;
  final bool isDetail;
  final Function(ReviewItem)? onImageTap;
  final Function(ReviewItem)? onReport;

  const ReviewList({ Key? key, required this.data, this.isDetail = false, this.onImageTap, this.onReport }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: data.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  loadImageProfile(data[index].userImage ?? "", 25),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      data[index].userName ?? "no name",
                      style: info1.copyWith(color: basic),
                    ),
                  ),
                  const SizedBox(width: 10),
                  isDetail ? InkWell(
                    onTap: (){
                      onReport!(data[index]);
                    },
                    child: const Icon(Icons.more_vert,
                      size: 20, 
                      color: black
                    )
                  ) : Container()
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star_rate_rounded,
                    size: 16,
                    color: star
                  ),
                  const SizedBox(width: 5),
                  Text("${data[index].rate}/5",
                    style: info1.copyWith(color: basic)
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: Text(
                  data[index].comment!.isNotEmpty 
                  ? data[index].comment!
                  : "Tidak ada komentar",
                  style: bodyText.copyWith(color: data[index].comment!.isNotEmpty 
                  ? basic : neutralGrey)
                ),
              ),
              data[index].productImage!.isNotEmpty 
              ? Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data[index].productImage!.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: (){
                          Get.toNamed(RouteName.storeProductReviewImage, 
                            arguments: ReviewImageItem(
                              userName: data[index].userName!,
                              rate: data[index].rate!,
                              comment: data[index].comment!,
                              imagePath: data[index].productImage![i]
                            ).toJson()
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 22),
                          child: Material(
                            elevation: 5,
                            borderRadius: const BorderRadius.all(Radius.circular(8)), 
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              child: loadImageSquare(data[index].productImage?[i] ?? "", 70)
                            )
                          ),
                        ),
                      );
                    },
                  ),
                )
              ): Container(),
              const SizedBox(height: 10),
              const Divider(
                color: neutralGrey
              )
            ],
          ),
        );
      },
    );
  }
}