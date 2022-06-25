import 'package:flutter/material.dart';

class MainResultText extends StatelessWidget {
  final String text;

  const MainResultText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black;

    return text != ''
        ? Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 56,
                  color: textColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
