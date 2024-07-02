import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalaculatorScreen1 extends StatefulWidget {
  const CalaculatorScreen1({super.key});

  @override
  State<CalaculatorScreen1> createState() => _CalaculatorScreen1State();
}

class _CalaculatorScreen1State extends State<CalaculatorScreen1> {
  String sum = '0', res = '0', exp1 = '0';

  Widget button(String text, Color fontcolor, Color _color, double Width) {
    return InkWell(
      onTap: () {
        if (text == '=') {
          try {
            exp1 = sum;
            exp1 = exp1.replaceAll("×", "*");
            exp1 = exp1.replaceAll("÷", "/");

            Parser p = Parser();
            Expression exp2 = p.parse(exp1);
            ContextModel con = ContextModel();
            res = "${exp2.evaluate(EvaluationType.REAL, con)}";
            setState(() {});
          } catch (e) {
            res = "Error";
            setState(() {});
          }
        } else if (text == 'AC') {
          sum = '0';
          res = '0';
          setState(() {});
        } else if (text == 'C') {
          if (sum.length == 1) {
            sum = '0';
            setState(() {});
          } else {
            sum = sum.substring(0, sum.length - 1);
            setState(() {});
          }
        } else {
          if (sum == '0') {
            sum = text;
            setState(() {});
          } else {
            sum = sum + text;
            setState(() {});
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: Width,
        decoration: BoxDecoration(
            color: _color, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(color: fontcolor, fontSize: 44),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(44, 41, 42, 1),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(110, 51, 51, 47),
          title: Center(
            child: Text(
              'Calculator',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                sum,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                res,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('AC', Colors.white, Colors.blueGrey, 80),
                  button('%', Colors.white, Colors.blueGrey, 80),
                  button('÷', Colors.white, Colors.blueGrey, 80),
                  button('C', Colors.white, Colors.orange, 80),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('7', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('8', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('9', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('×', Colors.white, Colors.orange, 80),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('4', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('5', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('6', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('-', Colors.white, Colors.orange, 80),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('1', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('2', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('3', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('+', Colors.white, Colors.orange, 80),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  button('0', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 180),
                  button('.', Colors.white,
                      const Color.fromARGB(255, 68, 67, 67), 80),
                  button('=', Colors.white, Colors.orange, 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
