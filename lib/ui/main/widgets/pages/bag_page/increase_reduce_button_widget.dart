import 'package:flutter/material.dart';

class IncreaseReduceButtonWidget extends StatelessWidget {
  const IncreaseReduceButtonWidget({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.borderRadius,
  });

  final void Function() onTap;
  final IconData iconData;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 6,
        ),
        child: Icon(iconData),
      ),
    );
  }
}
