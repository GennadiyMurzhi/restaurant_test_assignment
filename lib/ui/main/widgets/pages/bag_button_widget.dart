import 'package:flutter/material.dart';

class BagButtonWidget extends StatelessWidget {
  const BagButtonWidget({
    super.key,
    required this.label,
    this.padding,
    required this.onPressed,
  });

  final String label;
  final double? padding;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    if (padding == null) {
      return _BagButtonWidget(label: label, onPressed: onPressed);
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: padding!),
        child: _BagButtonWidget(label: label, onPressed: onPressed),
      );
    }
  }
}

class _BagButtonWidget extends StatelessWidget {
  const _BagButtonWidget({
    required this.label,
    required this.onPressed,
  });

  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF3364E0)),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.1)),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 15)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.maxFinite,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
