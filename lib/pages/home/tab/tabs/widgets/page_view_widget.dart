import 'package:flutter/material.dart';

import './/components/media_queries.dart';

// ignore: must_be_immutable
class PageViewWidget extends StatelessWidget {
  String image;
  PageViewWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: m_h(context) * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
