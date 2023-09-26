import 'package:calculator/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color textColor;
  final double paddingValue;

  const CalculatorButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.paddingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: () {
            value.numClick(buttonText);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: const CircleBorder(),
            padding: EdgeInsets.all(paddingValue),
          ),
          child: Text(
            buttonText,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
