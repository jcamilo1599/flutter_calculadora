import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/controllers/calculator_controller.dart';
import '../common/calc_button.dart';
import '../common/math_results.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());
    final MainAxisAlignment mainAxisAlignment =
        MediaQuery.of(context).size.width > 600
            ? MainAxisAlignment.end
            : MainAxisAlignment.center;

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        const MathResults(),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            CalculatorButton(
              text: 'AC',
              bgColor: const Color(0xffa2a2a2),
              onPressed: controller.resetAll,
            ),
            CalculatorButton(
              text: '+/-',
              bgColor: const Color(0xffa2a2a2),
              onPressed: controller.changeNegativePositive,
            ),
            CalculatorButton(
              text: 'del',
              bgColor: const Color(0xffa2a2a2),
              onPressed: controller.deleteLastEntry,
            ),
            CalculatorButton(
              text: '/',
              bgColor: const Color(0xffa2a2a2),
              onPressed: () => controller.selectOperation('/'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <CalculatorButton>[
            CalculatorButton(
              text: '7',
              onPressed: () => controller.addNumber('7'),
            ),
            CalculatorButton(
              text: '8',
              onPressed: () => controller.addNumber('8'),
            ),
            CalculatorButton(
              text: '9',
              onPressed: () => controller.addNumber('9'),
            ),
            CalculatorButton(
              text: 'X',
              bgColor: const Color(0xff3b9ff0),
              onPressed: () => controller.selectOperation('X'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <CalculatorButton>[
            CalculatorButton(
              text: '4',
              onPressed: () => controller.addNumber('4'),
            ),
            CalculatorButton(
              text: '5',
              onPressed: () => controller.addNumber('5'),
            ),
            CalculatorButton(
              text: '6',
              onPressed: () => controller.addNumber('6'),
            ),
            CalculatorButton(
              text: '-',
              bgColor: const Color(0xff3b9ff0),
              onPressed: () => controller.selectOperation('-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <CalculatorButton>[
            CalculatorButton(
              text: '1',
              onPressed: () => controller.addNumber('1'),
            ),
            CalculatorButton(
              text: '2',
              onPressed: () => controller.addNumber('2'),
            ),
            CalculatorButton(
              text: '3',
              onPressed: () => controller.addNumber('3'),
            ),
            CalculatorButton(
              text: '+',
              bgColor: const Color(0xff3b9ff0),
              onPressed: () => controller.selectOperation('+'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <CalculatorButton>[
            CalculatorButton(
              text: '0',
              big: true,
              onPressed: () => controller.addNumber('0'),
            ),
            CalculatorButton(
              text: ',',
              onPressed: controller.addDecimalComma,
            ),
            CalculatorButton(
              text: '=',
              bgColor: const Color(0xff3b9ff0),
              onPressed: controller.calculateResult,
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
