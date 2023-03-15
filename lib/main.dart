import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String ongoingCalculation = "0";
  String finalResult = "0";

  String leftValue = "";
  String rightValue = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF202020),
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Color(0xFF202020),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //color: Colors.white,
              width: 1150,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      ongoingCalculation,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(finalResult,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusable(Color.fromARGB(255, 189, 25, 14), "C", () {
                      setState(() {
                        ongoingCalculation = "0";
                        finalResult = "0";
                        leftValue = "0";
                      });
                    }),
                    reusable(Colors.orange, "+/-", () {
                      leftValue = "-" + leftValue;
                      ongoingCalculation = leftValue;
                    }),
                    reusable(Colors.orange, "^", () {
                      setState(() {
                        leftValue += "^";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.orange, "/", () {
                      setState(() {
                        leftValue += "/";
                        ongoingCalculation = leftValue;
                      });
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusable(Colors.white, "7", () {
                      setState(() {
                        leftValue += "7";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, "8", () {
                      setState(() {
                        leftValue += "8";
                        ongoingCalculation = leftValue;
                      });
                      //return 8;
                    }),
                    reusable(Colors.white, "9", () {
                      setState(() {
                        leftValue += "9";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.orange, "X", () {
                      setState(() {
                        leftValue += "*";
                        ongoingCalculation = leftValue;
                      });
                      //return "*";
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusable(Colors.white, "4", () {
                      setState(() {
                        leftValue += "4";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, "5", () {
                      setState(() {
                        leftValue += "5";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, "6", () {
                      setState(() {
                        leftValue += "6";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.orange, "-", () {
                      setState(() {
                        leftValue += "-";
                        ongoingCalculation = leftValue;
                      });
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusable(Colors.white, "1", () {
                      setState(() {
                        leftValue += "1";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, "2", () {
                      setState(() {
                        leftValue += "2";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, "3", () {
                      setState(() {
                        leftValue += "3";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.orange, "+", () {
                      setState(() {
                        leftValue += "+";
                        ongoingCalculation = leftValue;
                      });
                    }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusable(Colors.white, "0", () {
                      setState(() {
                        leftValue += "0";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    reusable(Colors.white, ".", () {
                      setState(() {
                        leftValue += ".";
                        ongoingCalculation = leftValue;
                      });
                    }),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(310, 100)),
                      onPressed: () {
                        setState(() {
                          //mymatod();
                          Parser p = Parser();
                          Expression exp = p.parse(leftValue);
                          //ongoingCalculation = exp.toString();

                          exp.simplify();
                          finalResult = exp.toString();
                          exp.derive(finalResult);

                          //print(exp);

                          //exp.evaluate(EvaluationType.REAL, ContextModel());
                        });
                      },
                      child: Text(
                        "=",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector reusable(Color colour, String txt, Function myfunc) {
    return GestureDetector(
      onTap: () {
        setState(() {
          myfunc();
        });
      },
      child: Text(
        txt.toString(),
        style:
            TextStyle(color: colour, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
