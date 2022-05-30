import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ImageRoundedPicker extends StatelessWidget {

  final String title;
  final String imagePath;
  final double size;
  final VoidCallback? onRemoveClicked;
  final VoidCallback? onPickClicked;

  const ImageRoundedPicker({ Key? key, this.imagePath = "", this.onRemoveClicked, this.onPickClicked, this.size = 90, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: info1.copyWith(color: darkGrey),
        ), 
        imagePath.isEmpty ?
          Padding(
            padding: const EdgeInsets.only(top: 6.0, right: 20.0,),
            child: InkWell(
              onTap: onPickClicked,
              child: loadImageAssetSquare("assets/images/add_image.png", size)
            ),
          )
          : SizedBox(
            width: size+20,
            child: Stack(
              children:[
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.file(
                      File(imagePath),
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: size-15,
                  top: 0,
                  child: InkWell(
                    splashColor: secondary,
                    child: const CircleAvatar(
                      child: Icon(
                        Icons.close_rounded,
                        color: white,
                        size: 15
                      ),
                      backgroundColor: darkGrey,
                      radius: 12
                    ),
                    onTap: onRemoveClicked,
                  ),
                ),
              ]
            ),
          )
      ]
    );
  }
}