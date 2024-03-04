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
      final String firstNumber = controller.firstNumber.toString().thousand;
      final String secondNumber = controller.secondNumber.toString().thousand;
      final String subResult =
          '$firstNumber${controller.operation}$secondNumber';

      return Column(
        children: <Widget>[
          SubResult(text: subResult),
          if (controller.mathResult.isNotEmpty)
            Divider(
              height: 20,
              color: Colors.grey.withOpacity(.2),
            ),
          MainResultText(text: controller.mathResult.value.thousand),
        ],
      );
    });
  }
}
