import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

Widget loadImageProfile(String url, double size) {
  try{
    if(url.isEmpty || !url.contains("http")){
      return loadImageAssetSquare("assets/images/profile_2.png", size);
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: CachedNetworkImage(
        imageUrl: url,
        height: size,
        width: size,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => 
          CircularProgressIndicator(
            value: downloadProgress.progress,
            color: note,
        ),
        errorWidget: (context, url, error) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(size),
            child: loadImageAssetSquare("assets/images/profile_2.png", size));
        },
      ),
    );
  }on Exception catch(_){
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: loadImageAssetSquare("assets/images/profile_2.png", size));
  }
}

Widget loadImageSquare(String url, double size) {
  try{
    if(url.isEmpty || !url.contains("http")){
      return loadImageAssetSquare("assets/images/profile_2.png", size);
    }
    return CachedNetworkImage(
      imageUrl: url,
      height: size,
      width: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => loadingCircle(),
      errorWidget: (context, url, error) => loadImageAssetSquare("assets/images/profile_2.png", size),
    );
  }on Exception catch(_){
    return loadImageAssetSquare("assets/images/profile_2.png", size);
  }
}

Widget loadImageAssetSquare(String image, double size) {
  try{
    return Image.asset(
      image,
      height: size,
      width: size,
      fit: BoxFit.contain,
    );
  }on Exception catch(_){
    return Image.asset(
      "assets/images/profile_2.png",
      height: size,
      width: size,
      fit: BoxFit.cover,
    );
  }
}