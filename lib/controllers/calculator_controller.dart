import 'package:get/get.dart';

class CalculatorController extends GetxController {
  RxBool isCalculable = false.obs;
  RxString firstNumber = ''.obs;
  RxString secondNumber = ''.obs;
  RxString mathResult = ''.obs;
  RxString operation = ''.obs;

  void resetAll() {
    isCalculable.value = false;
    firstNumber.value = '';
    secondNumber.value = '';
    mathResult.value = '';
    operation.value = '';
  }

  void changeNegativePositive() {
    if (mathResult.startsWith('-')) {
      mathResult.value = mathResult.value.replaceFirst('-', '');
    } else {
      mathResult.value = '-${mathResult.value}';
    }
  }

  String addNumber(String number) {
    isCalculable.value = true;

    String result = (mathResult.value == '0')
        ? mathResult.value = number
        : (mathResult.value == '-0')
            ? mathResult.value = '-$number'
            : mathResult.value = mathResult.value + number;

    return result;
  }

  void addDecimalPoint() {
    if (!mathResult.contains('.')) {
      if (mathResult.startsWith('0')) {
        mathResult.value = '0.';
      } else {
        mathResult.value = '${mathResult.value}.';
      }
    }
  }

  void selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    secondNumber.value = '';
    mathResult.value = '0';
  }

  void deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  void calculateResult() {
    if (isCalculable.value) {
      double num1 = double.parse(firstNumber.value);
      double num2 = double.parse(mathResult.value);

      isCalculable.value = false;
      secondNumber.value = mathResult.value;

      switch (operation.value) {
        case '+':
          mathResult.value = '${num1 + num2}';
          break;
        case '-':
          mathResult.value = '${num1 - num2}';
          break;
        case '/':
          mathResult.value = '${num1 / num2}';
          break;
        case 'X':
          mathResult.value = '${num1 * num2}';
          break;
      }

      if (mathResult.value.endsWith('.0')) {
        mathResult.value =
            mathResult.value.substring(0, mathResult.value.length - 2);
      }
    }
  }
}
