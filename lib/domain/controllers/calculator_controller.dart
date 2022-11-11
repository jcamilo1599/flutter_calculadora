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

    if (mathResult.value == '0') {
      return mathResult.value = number;
    }

    if (mathResult.value == '-0') {
      return mathResult.value = '-$number';
    }

    return mathResult.value = mathResult.value + number;
  }

  void addDecimalComma() {
    if (!mathResult.contains(',')) {
      if (mathResult.startsWith('0')) {
        mathResult.value = '0,';
      } else {
        mathResult.value = '${mathResult.value},';
      }
    }
  }

  void selectOperation(String newOperation) {
    if (mathResult.value != '0') {
      calculateResult();

      operation.value = newOperation;
      firstNumber.value = mathResult.value;
      secondNumber.value = '';
      mathResult.value = '0';
    }
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
    if (!isCalculable.value) {
      return;
    }

    final String cleanFirstNumber = (firstNumber.value != '')
        ? firstNumber.value.replaceAll('.', '').replaceAll(',', '.')
        : '0';

    final String cleanMathResult = (mathResult.value != '')
        ? mathResult.value.replaceAll('.', '').replaceAll(',', '.')
        : '0';

    final double num1 = double.parse(cleanFirstNumber);
    final double num2 = double.parse(cleanMathResult);

    isCalculable.value = false;
    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case '+':
        mathResult.value = (num1 + num2).toStringAsFixed(2);
        break;
      case '-':
        mathResult.value = (num1 - num2).toStringAsFixed(2);
        break;
      case '/':
        mathResult.value = (num1 / num2).toStringAsFixed(6);
        break;
      case 'X':
        mathResult.value = (num1 * num2).toString();
        break;
    }

    if (mathResult.value.endsWith('.0')) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }

    mathResult.value = mathResult.value.replaceAll('.', ',');
  }
}
