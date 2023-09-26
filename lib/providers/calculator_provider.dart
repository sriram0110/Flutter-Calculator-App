import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; //library for parsing mathematical expressions

class CalculatorProvider extends ChangeNotifier {
  String history = '';
  String expression = '';

  void numClick(String text) {
    switch (text) {
      case 'AC':
        allClear();
        break;
      case 'C':
        clear();
        break;
      case '=':
        calculate();
        break;
      case 'x':
        handleOperator('*');
        break;
      case '+/-':
        toggleSign();
        break;
      default:
        if (isNumeric(text)) {
          handleNumber(text);
        } else if (isOperator(text)) {
          handleOperator(text);
        }
        break;
    }
  }

  void toggleSign() {
    if (expression[0] != '-') {
      expression = '-$expression';
    } else {
      expression = expression.substring(1);
      notifyListeners();
    }
  }

  void handleNumber(String text) {
    if (expression.length == 11) {
      return;
    }
    expression += text;
    notifyListeners();
  }

  bool isOperator(String str) {
    return ['+', '-', 'x', '/', '.', '%'].contains(str);
  }

  void handleOperator(String text) {
    if (expression.isNotEmpty) {
      if (text == '*' && expression[expression.length - 1] == '*') {
        return;
      }
      if (text == '-' && expression[expression.length - 1] == '-') {
        return;
      }

      if (text == '%' && isNumeric(expression[expression.length - 1])) {
        expression += text;
      } else if (isOperator(expression[expression.length - 1])) {
        expression = expression.substring(0, expression.length - 1);
      }
      expression += text;
      notifyListeners();
    }
  }

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  void calculate() {
    if (expression.trim().isEmpty) {
      return;
    }
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    double result = double.parse(eval.toStringAsFixed(2));

    history = expression;
    expression = result.toString();
    if (expression == history) {
      expression = '';
    }
    notifyListeners();
  }

  void allClear() {
    expression = '';
    history = '';
    notifyListeners();
  }

  void clear() {
    expression = '';
    notifyListeners();
  }

  void delete() {
    if (expression.isNotEmpty) {
      expression = expression.substring(0, expression.length - 1);
      notifyListeners();
    }
  }
}
