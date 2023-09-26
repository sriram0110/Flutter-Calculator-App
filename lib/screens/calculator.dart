import 'package:calculator/providers/calculator_provider.dart';
import 'package:calculator/widgets/calculator_button_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text('Calculator App'),
        backgroundColor: Colors.black,
      ), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              child: Column( 
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    alignment: Alignment.bottomRight,
                    child: Consumer<CalculatorProvider>(
                      builder: (context, value, child) {
                        return Text(
                          value.history,
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.grey[800],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.bottomRight,
                    child: Consumer<CalculatorProvider>(
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton( 
                              splashColor: Colors.redAccent,
                              color: Colors.red,
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                Provider.of<CalculatorProvider>(context,
                                        listen: false)
                                    .delete();
                              },
                            ),
                            Text(
                              value.expression,
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 50,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0, 
            ),
            const CalculatorButtonsRow(
              buttonText1: 'AC',
              buttonText2: 'C',
              buttonText3: '%',
              buttonText4: '/',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CalculatorButtonsRow(
              buttonText1: '7',
              buttonText2: '8',
              buttonText3: '9',
              buttonText4: 'x',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CalculatorButtonsRow(
              buttonText1: '4',
              buttonText2: '5',
              buttonText3: '6',
              buttonText4: '-',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CalculatorButtonsRow(
              buttonText1: '1',
              buttonText2: '2',
              buttonText3: '3',
              buttonText4: '+',
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CalculatorButtonsRow(
              buttonText1: '.',
              buttonText2: '0',
              buttonText3: '+/-',
              buttonText4: '=',
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
