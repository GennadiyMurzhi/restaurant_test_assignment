import 'package:flutter/material.dart';

class IncreaseReduceButtonWidget extends StatelessWidget {
  const IncreaseReduceButtonWidget({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final void Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
