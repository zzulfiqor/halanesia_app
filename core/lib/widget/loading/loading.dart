import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core.dart';

Widget loadingCircle() {
  return const Center(
    child: SpinKitFadingCircle(
      color: secondary, size: 46.0),
  );
}

Widget loadingSmallCircle() {
  return const SpinKitFadingCircle(
    color: secondary, size: 26.0);
}