import 'package:flutter/material.dart';

class ConversionItem extends StatefulWidget {
  const ConversionItem({
    super.key,
    required this.conversionRate,
    required this.firstUnitName,
    required this.secondUnitName,
    this.conversionFunctionFirst,
    this.conversionFunctionSecond,
  });
  final String firstUnitName;
  final String secondUnitName;
  final double conversionRate;
  final Function(double valueToConvert)? conversionFunctionFirst;
  final Function(double valueToConvert)? conversionFunctionSecond;

  @override
  State<ConversionItem> createState() => _ConversionItemState();
}

class _ConversionItemState extends State<ConversionItem> {
  double firstUnitValue = 0;
  double secondUnitValue = 0;
  String errMsg1 = "";
  String errMsg2 = "";
  final TextEditingController _firstValueController = TextEditingController();
  final TextEditingController _secondfValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.firstUnitName),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onTap:
                () =>
                    _firstValueController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _firstValueController.value.text.length,
                    ),
            keyboardType: TextInputType.number,
            controller: _firstValueController,
            decoration: InputDecoration(
              hintText: "1",
              helperText: widget.firstUnitName,
              focusedErrorBorder:
                  (errMsg1.isEmpty)
                      ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.green),
                      )
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.red),
                      ),
              errorBorder:
                  (errMsg1.isNotEmpty)
                      ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.red),
                      )
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
              errorText: (errMsg1.isNotEmpty) ? errMsg1 : "",
            ),

            onChanged:
                (newFirstUnitValue) => setState(() {
                  try {
                    firstUnitValue = double.parse(newFirstUnitValue);
                    errMsg1 = "";
                  } catch (err) {
                    errMsg1 = "Must be a valid number";
                    firstUnitValue = 0;
                  }
                  if (widget.conversionFunctionFirst != null) {
                    secondUnitValue = widget.conversionFunctionFirst!(
                      firstUnitValue,
                    );
                  } else {
                    secondUnitValue = firstUnitValue * widget.conversionRate;
                  }
                  _secondfValueController.text = secondUnitValue
                      .toStringAsFixed(3);
                }),
          ),
        ),

        Text(widget.secondUnitName),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _secondfValueController,
            onTap:
                () =>
                    _secondfValueController.selection = TextSelection(
                      baseOffset: 0,
                      extentOffset: _secondfValueController.value.text.length,
                    ),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "2.54",
              helperText: widget.secondUnitName,
              focusedErrorBorder:
                  (errMsg2.isEmpty)
                      ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.green),
                      )
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.red),
                      ),
              errorBorder:
                  (errMsg2.isNotEmpty)
                      ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: Colors.red),
                      )
                      : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
              errorText: (errMsg2.isNotEmpty) ? errMsg2 : "",
            ),
            onChanged:
                (newSecondUnitValue) => setState(() {
                  try {
                    secondUnitValue = double.parse(newSecondUnitValue);
                    errMsg2 = "";
                  } catch (err) {
                    errMsg2 = "Must be a valid number";
                    secondUnitValue = 0;
                  }
                  if (widget.conversionFunctionSecond != null) {
                    firstUnitValue = widget.conversionFunctionSecond!(
                      secondUnitValue,
                    );
                  } else {
                    firstUnitValue = secondUnitValue / widget.conversionRate;
                  }
                  _firstValueController.text = firstUnitValue.toStringAsFixed(
                    3,
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class UnitSelector extends StatefulWidget {
  const UnitSelector({super.key});

  @override
  State<UnitSelector> createState() => UnitSelectorState();
}

List<String> sampleDropdownItems = <String>['One', 'Two', 'Three'];

class UnitSelectorState extends State<UnitSelector> {
  String dropDownValue = sampleDropdownItems.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      items:
          sampleDropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropDownValue = value!;
        });
      },
    );
  }
}
