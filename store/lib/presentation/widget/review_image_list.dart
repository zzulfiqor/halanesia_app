import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:store/data/product_review_image_response.dart';

class ReviewImageList extends StatelessWidget {

  final List<ReviewImageItem> data;
  final Function(ReviewImageItem) onImageTap;

  const ReviewImageList({ Key? key, required this.data, required this.onImageTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              onImageTap(data[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Material(
                elevation: 5,
                borderRadius: const BorderRadius.all(Radius.circular(8)), 
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: loadImageSquare(data[index].imagePath ?? "", 70)
                )
              ),
            ),
          );
        },
      ),
    );
  }
}