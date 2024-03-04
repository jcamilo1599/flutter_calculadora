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
        child: LayoutBuilder(builder: (_, BoxConstraints constraints) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: _buildBody(
              context,
              maxWidth: constraints.maxWidth,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context, {
    required double maxWidth,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(child: Container()),
        const MathResults(),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _buildBtns(maxWidth: maxWidth),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  List<Widget> _buildBtns({required double maxWidth}) {
    final CalculatorController controller = Get.put(CalculatorController());

    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CalculatorButton(
            maxWidth: maxWidth,
            text: 'AC',
            bgColor: const Color(0xff606060),
            onPressed: controller.resetAll,
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '+/-',
            bgColor: const Color(0xff606060),
            onPressed: controller.changeNegativePositive,
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: 'del',
            bgColor: const Color(0xff606060),
            onPressed: controller.deleteLastEntry,
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: ' / ',
            bgColor: const Color(0xff606060),
            onPressed: () => controller.selectOperation(' / '),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CalculatorButton(
            maxWidth: maxWidth,
            text: '7',
            onPressed: () => controller.addNumber('7'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '8',
            onPressed: () => controller.addNumber('8'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '9',
            onPressed: () => controller.addNumber('9'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: ' x ',
            bgColor: const Color(0xff3b9ff0),
            onPressed: () => controller.selectOperation(' x '),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CalculatorButton(
            maxWidth: maxWidth,
            text: '4',
            onPressed: () => controller.addNumber('4'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '5',
            onPressed: () => controller.addNumber('5'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '6',
            onPressed: () => controller.addNumber('6'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: ' - ',
            bgColor: const Color(0xff3b9ff0),
            onPressed: () => controller.selectOperation(' - '),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CalculatorButton(
            maxWidth: maxWidth,
            text: '1',
            onPressed: () => controller.addNumber('1'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '2',
            onPressed: () => controller.addNumber('2'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '3',
            onPressed: () => controller.addNumber('3'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: ' + ',
            bgColor: const Color(0xff3b9ff0),
            onPressed: () => controller.selectOperation(' + '),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CalculatorButton(
            maxWidth: maxWidth,
            text: '0',
            isBig: true,
            onPressed: () => controller.addNumber('0'),
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: ',',
            onPressed: controller.addDecimalComma,
          ),
          CalculatorButton(
            maxWidth: maxWidth,
            text: '=',
            bgColor: const Color(0xff3b9ff0),
            onPressed: controller.calculateResult,
          ),
        ],
      ),
    ];
  }
}
