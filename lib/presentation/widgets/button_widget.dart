import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonType buttonType;
  const ButtonWidget({
    required this.onPressed,
    required this.child,
    this.buttonType = ButtonType.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getButtonByType();
  }

  Widget _getButtonByType() {
    Widget element;
    switch (buttonType) {
      case ButtonType.primary:
        element = SizedBox(
            width: 200,
            child: OutlinedButton(onPressed: onPressed, child: child));
        break;
      case ButtonType.secondary:
        element = SizedBox(
          width: 200,
          child: OutlinedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: child),
        );
        break;
      default:
        element = OutlinedButton(onPressed: onPressed, child: child);
    }
    return Container(child: element);
  }
}
