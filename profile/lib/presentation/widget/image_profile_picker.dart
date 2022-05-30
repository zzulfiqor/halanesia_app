import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageProfilePicker extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback? onChangeClicked;

  const ImageProfilePicker(
      {Key? key, this.imagePath = "", this.onChangeClicked, this.size = 70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(35.0),
      child: InkWell(
        onTap: onChangeClicked,
        child: Stack(
          children: [
            imagePath.isEmpty 
            ? loadImageAssetSquare("assets/images/profile_2.png", size)
            : loadImageProfile(imagePath, size),
            // CachedNetworkImage(
            //   imageUrl: imagePath,
            //   width: size,
            //   height: size,
            //   fit: BoxFit.cover,
            // ),
            // : Image.file(
            //   File(imagePath),
            //   width: size,
            //   height: size,
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              top: 45,
              child: Container(
                width: size,
                height: 25,
                color: transparentGrey,
                child: Center(
                    child: Text("Ubah",
                        style:
                            subTitle2.copyWith(color: white, fontSize: 11)))),
          )
        ]),
      ),
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     imagePath.isEmpty ?
    //       Padding(
    //         padding: const EdgeInsets.only(top: 6.0, right: 20.0,),
    //         child: InkWell(
    //           onTap: onChangeClicked,
    //           child: loadImageAssetSquare("assets/images/add_image.png", size)
    //         ),
    //       )
    //       : SizedBox(
    //         width: size+20,
    //         child: Stack(
    //           children:[
    //             Padding(
    //               padding: const EdgeInsets.only(top: 6.0),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(5.0),
    //                 child: Image.file(
    //                   File(imagePath),
    //                   width: size,
    //                   height: size,
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //             ),
    //           ]
    //         ),
    //       )
    //   ]
    // );
  }
}
