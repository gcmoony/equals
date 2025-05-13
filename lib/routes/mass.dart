import 'package:equals/classes/ConversionClass.dart';
import 'package:flutter/material.dart';

class MassPage extends StatelessWidget {
  const MassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mass Conversions")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConversionItem(
            conversionRate: 0.45359237,
            firstUnitName: "Pound",
            secondUnitName: "Kilogram",
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [Text("First Unit"), UnitSelector()]),
              Column(children: [Text("Second Unit"), UnitSelector()]),
            ],
          ),
        ],
      ),
    );
  }
}
