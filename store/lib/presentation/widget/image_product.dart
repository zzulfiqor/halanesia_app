import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  
  final String? image;

  const ImageProduct({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loadImageAssetSquare(
      image!,
      MediaQuery. of(context).size.width,
    );
  }
}