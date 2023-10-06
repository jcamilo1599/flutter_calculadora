import 'package:flutter/material.dart';

import 'ui/common/tokens/themes.dart';
import 'ui/pages/calculator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: CalculatorPage(),
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
