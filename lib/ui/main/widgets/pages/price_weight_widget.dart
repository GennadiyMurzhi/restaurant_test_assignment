import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class PriceWeightWidget extends StatelessWidget {
  const PriceWeightWidget({
    super.key,
    required this.price,
    required this.weight,
  });

  final double price;
  final int weight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '${Decimal.parse(price.toString())}₽',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
          ),
          TextSpan(
            text: ' · $weightг',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}
