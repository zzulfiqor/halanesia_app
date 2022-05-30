import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MerchantCourierItem extends StatelessWidget {
  const MerchantCourierItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Courier Logo
          Image.asset('assets/images/dummy_courier_image.png'),

          // Courier Information
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                "Sicepat Ekspres",
                style: title3,
              ),

              // Type
              const SizedBox(height: 4),
              Text(
                "Reguler, Next Day, GoKil (Kargo)",
                style: title2.copyWith(color: darkGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
