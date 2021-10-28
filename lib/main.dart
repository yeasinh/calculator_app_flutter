import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _expression = '';
  String _result = '';

  void opClicked(String text) {
    setState(() {
      _result += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void clear(String text) {
    setState(() {
      _result = '';
    });
  }

  void evaluate(String text) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_result);
      ContextModel cm = ContextModel();

      setState(() {
        _expression = _result;
        _result = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    } catch (e) {
      opClicked(' Invalid input');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                _expression,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF545F61),
                ),
              ),
              alignment: const Alignment(1, 1),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _result,
                style: const TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              alignment: const Alignment(1, 1),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: 0xFF6C807F,
                  textColor: 0xFF000000,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: 0xFF6C807F,
                  textColor: 0xFF000000,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: opClicked,
                ),
                CalcButton(
                  text: '/',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: opClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '8',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '9',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '*',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: opClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '5',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '6',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '-',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: opClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '2',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '3',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '+',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: opClicked,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '0',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '00',
                  callback: opClicked,
                ),
                CalcButton(
                  text: '=',
                  fillColor: 0xFFFFFFFF,
                  textColor: 0xFF65BDAC,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton(
      {Key? key,
      this.fillColor = 0xFF283637,
      required this.text,
      this.textColor = 0xFFFFFFFF,
      this.textSize = 24,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
