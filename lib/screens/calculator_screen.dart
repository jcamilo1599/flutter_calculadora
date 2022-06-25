import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:calculadora/controllers/calculator_controller.dart';

import 'package:calculadora/widgets/math_results.dart';
import 'package:calculadora/widgets/calc_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculatorController controller = Get.put(CalculatorController());
    final MainAxisAlignment mainAxisAlignment =
        MediaQuery.of(context).size.width > 600
            ? MainAxisAlignment.end
            : MainAxisAlignment.center;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const MathResults(),
              Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    bgColor: const Color(0xffa2a2a2),
                    onPressed: () => controller.resetAll(),
                  ),
                  CalculatorButton(
                    text: '+/-',
                    bgColor: const Color(0xffa2a2a2),
                    onPressed: () => controller.changeNegativePositive(),
                  ),
                  CalculatorButton(
                    text: 'del',
                    bgColor: const Color(0xffa2a2a2),
                    onPressed: () => controller.deleteLastEntry(),
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
                children: [
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
                children: [
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
                children: [
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
                children: [
                  CalculatorButton(
                    text: '0',
                    big: true,
                    onPressed: () => controller.addNumber('0'),
                  ),
                  CalculatorButton(
                    text: '.',
                    onPressed: () => controller.addDecimalPoint(),
                  ),
                  CalculatorButton(
                    text: '=',
                    bgColor: const Color(0xff3b9ff0),
                    onPressed: () => controller.calculateResult(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
