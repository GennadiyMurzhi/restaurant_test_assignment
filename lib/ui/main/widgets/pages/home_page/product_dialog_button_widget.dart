import 'package:flutter/material.dart';

class ProductDialogButtonWidget extends StatelessWidget {
  const ProductDialogButtonWidget({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  final void Function() onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size(40, 40)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(11)),
      ),
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: 18,
        color: Colors.black,
      ),
    );
  }
}
