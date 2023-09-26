import 'package:calculator/providers/calculator_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test calculation', () {
    //setup variable
    CalculatorProvider calculator = CalculatorProvider();
    calculator.expression = '2+2';
    //do
    calculator.calculate();
    //test
    expect(calculator.expression, '4.0');
  });

  test('Test allClear', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.expression = '2+2';
    calculator.history = '2+2';
    calculator.allClear();
    expect(calculator.expression, '');
    expect(calculator.history, '');
  });

  test('Test clear', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.expression = '2+2';
    calculator.clear();
    expect(calculator.expression, '');
  });

  test('Test delete', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.expression = '2+2';
    calculator.delete();
    expect(calculator.expression, '2+');
  });

  test('Test numClick', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.numClick('1');
    calculator.numClick('2');
    calculator.numClick('+');
    calculator.numClick('3');
    calculator.calculate();
    expect(calculator.expression, '15.0');
  });

  test('Test numClick with AC', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.numClick('1');
    calculator.numClick('2');
    calculator.numClick('AC');
    expect(calculator.expression, '');
  });

  test('Test numClick with C', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.numClick('1');
    calculator.numClick('2');
    calculator.numClick('C');
    expect(calculator.expression, '');
  });

  test('Test numClick with x', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.numClick('1');
    calculator.numClick('2');
    calculator.numClick('x');
    expect(calculator.expression, '12*');
  });

  test('Test numClick with +/-', () {
    CalculatorProvider calculator = CalculatorProvider();
    calculator.numClick('1');
    calculator.numClick('2');
    calculator.numClick('+/-');
    expect(calculator.expression, '12-');
  });
}
