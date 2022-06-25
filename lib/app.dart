import 'package:calculadora/screens/calculator_screen.dart';
import 'package:flutter/cupertino.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: CalculatorScreen(),
    );
  }
}
