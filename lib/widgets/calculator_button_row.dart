import 'package:calculator/constants/button_constants.dart';
import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorButtonsRow extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  final String buttonText3;

  final String buttonText4;

  const CalculatorButtonsRow({
    super.key,
    required this.buttonText1,
    required this.buttonText2,
    required this.buttonText3,
    required this.buttonText4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalculatorButton(
            buttonText: buttonText1,
            buttonColor: ButtonConstants.defaultButtonColor,
            textColor: ButtonConstants.defaultTextColor,
            paddingValue: ButtonConstants.defaultPadding),
        CalculatorButton(
            buttonText: buttonText2,
            buttonColor: ButtonConstants.defaultButtonColor,
            textColor: ButtonConstants.defaultTextColor,
            paddingValue: ButtonConstants.defaultPadding),
        CalculatorButton(
            buttonText: buttonText3,
            buttonColor: ButtonConstants.defaultButtonColor,
            textColor: ButtonConstants.defaultTextColor,
            paddingValue: ButtonConstants.defaultPadding),
        CalculatorButton(
            buttonText: buttonText4,
            buttonColor: Colors.green[600],
            textColor: ButtonConstants.defaultTextColor,
            paddingValue: ButtonConstants.defaultPadding),
      ],
    );
  }
}
