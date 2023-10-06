import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double maxWidth;
  final Color bgColor;
  final bool isBig;

  const CalculatorButton({
    required this.text,
    required this.onPressed,
    required this.maxWidth,
    this.bgColor = const Color(0xff2d2d2d),
    this.isBig = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Estilos del botón
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: Colors.white,
      shape: const StadiumBorder(),
    );

    double btnHMargin = 5;
    double btnVMargin = 10;

    if (maxWidth < 380) {
      btnHMargin = 4;
      btnVMargin = 6;
    }

    return Expanded(
      flex: isBig ? 2 : 1,
      child: Container(
        margin: EdgeInsets.fromLTRB(btnHMargin, 0, btnHMargin, btnVMargin),
        child: TextButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
