import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controllers/calculator_controller.dart';
import '../../domain/extensions/string.dart';
import 'main_result.dart';
import 'sub_result.dart';

class MathResults extends StatelessWidget {
  const MathResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.find<CalculatorController>();

    return Obx(() {
      final String subResult =
          '${controller.firstNumber}${controller.operation}${controller.secondNumber}';

      return Column(
        children: <Widget>[
          SubResult(text: subResult.thousand),
          if (controller.mathResult.isNotEmpty)
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
          MainResultText(text: controller.mathResult.toString().thousand),
        ],
      );
    });
  }
}
