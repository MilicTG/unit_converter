import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double _numberForm;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces'
  ];

  @override
  void initState() {
    _numberForm = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit converter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Unit converter"),
        ),
        body: Center(
            child: Column(
          children: [
            TextField(
              onChanged: (text) {
                var rv = double.tryParse(text);
                if (rv != null) {
                  setState(() {
                    _numberForm = rv;
                  });
                }
              },
            ),
            Text((_numberForm == null) ? "" : _numberForm.toString())
          ],
        )),
      ),
    );
  }
}
