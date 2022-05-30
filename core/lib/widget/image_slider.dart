import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store/data/product_entity.dart';

import '../core.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key, required this.imageList}) : super(key: key);
  final List<ProductImageEntity> imageList;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return Center(
            child: Container(
                padding: const EdgeInsets.only(top: 200),
                child: Column(children: [
                  CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      viewportFraction: 0.7,
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: widget.imageList
                        .map((item) => Center(
                            child: CachedNetworkImage(
                                fit: BoxFit.contain, imageUrl: item.imagePath)))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.imageList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? darkGrey
                                      : secondary)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ])));
      },
    ));
  }
}
