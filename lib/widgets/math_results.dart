import 'package:calculadora/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sub_result.dart';
import 'main_result.dart';

class MathResults extends StatelessWidget {
  const MathResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalculatorController>();

    return Obx(() {
      final String subResult =
          '${controller.firstNumber}${controller.operation}${controller.secondNumber}';

      return Column(
        children: [
          SubResult(text: subResult),
          if (controller.mathResult.isNotEmpty)
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
          MainResultText(text: '${controller.mathResult}'),
        ],
      );
    });
  }
}
