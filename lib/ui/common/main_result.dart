import 'package:flutter/material.dart';

class MainResultText extends StatelessWidget {
  final String text;

  const MainResultText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black;

    if (text != '') {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        alignment: Alignment.centerRight,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 56,
              color: textColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
