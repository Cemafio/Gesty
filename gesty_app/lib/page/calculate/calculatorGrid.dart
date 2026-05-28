import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorGrid extends StatefulWidget {
  const CalculatorGrid({super.key});

  @override
  State<CalculatorGrid> createState() => _CalculatorGridState();
}

class _CalculatorGridState extends State<CalculatorGrid> {

  String expression = "";
  String result = "0";

  final List<String> buttons = [
    'C', '⌫', '%', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+', 
    '0', '000', '.', '='
  ];

  bool isOperator(String text) {
    return ['+', '-', '×', '÷', '='].contains(text);
  }

  void onButtonTap(String value) {
    // CLEAR
    if (value == 'C') {

      setState(() {
        expression = "";
        result = "0";
      });

      return;
    }

    // DELETE
    if (value == '⌫') {

      if (expression.isNotEmpty) {

        setState(() {
          expression = expression.substring(
            0,
            expression.length - 1,
          );
        });
      }
      return;
    }

    if (value == '=') {

      calculateResult();

      return;
    }

    setState(() {
      expression += value;
    });
  }

  void calculateResult() {

    try {

      String finalExpression = expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/');

      Parser parser = Parser();

      Expression exp =
          parser.parse(finalExpression);

      double eval = exp.evaluate(
        EvaluationType.REAL,
        ContextModel(),
      );

      setState(() {
        result = eval.toString();
      });

    } catch (e) {

      setState(() {
        result = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: .symmetric(horizontal: 10),

          decoration: BoxDecoration(
            color: const Color(0xFF242424),
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,

            children: [

              Text(
                expression,

                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontFamily: 'Jersey15',
                ),
              ),

              const SizedBox(height: 10),

              Text(
                result,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jersey15',
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: GridView.builder(
            padding: .all(10),
            itemCount: buttons.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),

            itemBuilder: (context, index) {

              final text = buttons[index];

              return Material(
                color: Colors.transparent,

                borderRadius:
                    BorderRadius.circular(14),

                child: Ink(
                  decoration: BoxDecoration(

                    color: isOperator(text)
                        ? const Color(0xFF8B12B1)
                        : const Color(0xFF242424),

                    borderRadius:
                        BorderRadius.circular(14),
                  ),

                  child: InkWell(

                    borderRadius:
                        BorderRadius.circular(14),

                    onTap: () {
                      onButtonTap(text);
                    },

                    child: Center(
                      child: Text(
                        text,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                          fontFamily: 'Jersey15',
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}