import 'package:equals/classes/ConversionClass.dart';
import 'package:flutter/material.dart';

class CommonToolsPage extends StatelessWidget {
  const CommonToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Common Conversions")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: const Text("Inch - Centimeter"),
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Inch - Centimeter"),
                          ),
                          body: ConversionItem(
                            conversionRate: 2.54,
                            firstUnitName: "Inch",
                            secondUnitName: "Centimeter",
                          ),
                        );
                      },
                    ),
                  ),
                },
          ),
          ListTile(
            title: const Text("Fahrenheit - Celsius"),
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Fahrenheit - Celsius"),
                          ),
                          body: ConversionItem(
                            conversionRate: 0,
                            firstUnitName: "Fahrenheit",
                            secondUnitName: "Celsius",
                            conversionFunctionFirst:
                                (value) => (value - 32) * (5 / 9),
                            conversionFunctionSecond:
                                (value) => (value * (9 / 5)) + 32,
                          ),
                        );
                      },
                    ),
                  ),
                },
          ),
        ],
      ),
    );
  }
}
