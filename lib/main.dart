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
  String _startMeasure;
  String _convertedMeasure;

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
    final TextStyle inputStyle =
        TextStyle(fontSize: 20, color: Colors.blue[900]);

    final TextStyle labelStyle =
        TextStyle(fontSize: 24, color: Colors.grey[700]);

    return MaterialApp(
      title: "Unit converter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Unit converter"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Value",
                  style: labelStyle,
                ),
                Spacer(),
                TextField(
                  style: inputStyle,
                  decoration: InputDecoration(
                    hintText: "Please insert the measure to be converted",
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberForm = rv;
                      });
                    }
                  },
                ),
                Spacer(),
                Text("From", style: labelStyle),
                DropdownButton(
                  isExpanded: true,
                  value: _startMeasure,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: inputStyle),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                ),
                Spacer(),
                Text("to", style: labelStyle),
                Spacer(),
                DropdownButton(
                    isExpanded: true,
                    style: inputStyle,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: inputStyle,
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _convertedMeasure = value;
                      });
                    },
                    value: _convertedMeasure),
                Spacer(flex: 2),
                ElevatedButton(
                    onPressed: () => true,
                    child: Text(
                      "Convert",
                      style: inputStyle,
                    )),
                Spacer(flex: 2),
                Text((_numberForm == null) ? "" : _numberForm.toString(),
                    style: labelStyle),
                Spacer(flex: 8)
              ],
            )),
      ),
    );
  }
}
