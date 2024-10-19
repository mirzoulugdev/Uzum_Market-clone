import 'package:flutter/material.dart';
import 'package:uzum_market/components/media_queries.dart';
import 'package:uzum_market/data/models/product_model.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  Product product;
  ProductWidget({required this.product, super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: m_h(context) * 0.8,
      width: m_w(context) * 0.47,
      child: Column(
        children: [
          Container(
            width: m_w(context) * 0.47,
            height: m_h(context) * 0.26,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.product.title,
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "${((double.parse(widget.product.price) * 1000 + 100)).toString()} so'm",
                    style: const TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${((double.parse(widget.product.price) * 1000)).toString()} so'm",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: const Center(
                  child: Icon(Icons.shopping_bag_outlined),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
