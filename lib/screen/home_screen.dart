import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '0';
  String result = '';
  String expression = '';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
      } else if (buttonText == 'Del') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('X', '*');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'ERROR';
        }
      } else {
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget myButton(
    String buttonText,
    Color colour,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: () => buttonPressed(buttonText),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 70,
            width: 70,
            color: colour,
            child: Center(
              child: Text(
                '$buttonText',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.indigo[100],
              padding: new EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 16.0,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                equation,
                style: TextStyle(
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.indigo[100],
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0,
              ),
              alignment: Alignment.centerRight,
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(top: 24, bottom: 12),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        myButton(
                          'C',
                          Colors.indigo[500],
                          Colors.white,
                        ),
                        myButton(
                          'Del',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                        myButton(
                          '%',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                        myButton(
                          '/',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        myButton(
                          '7',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '8',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '9',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          'X',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        myButton(
                          '4',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '5',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '6',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '+',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        myButton(
                          '1',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '2',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '3',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '-',
                          Colors.indigo[100],
                          Colors.indigoAccent[700],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 196,
                          child: myButton(
                            '0',
                            Colors.grey[350],
                            Colors.black,
                          ),
                        ),
                        myButton(
                          '.',
                          Colors.grey[350],
                          Colors.black,
                        ),
                        myButton(
                          '=',
                          Colors.indigo[400],
                          Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
