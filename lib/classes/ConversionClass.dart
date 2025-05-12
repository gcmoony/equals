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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectionArea(
                            child: Text(
                              firstUnitValue.toStringAsFixed(3),
                              style: Theme.of(context).textTheme.displaySmall,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        Text(widget.firstUnitName),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Center(child: Icon(Icons.multiple_stop))),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SelectionArea(
                            child: Text(
                              secondUnitValue.toStringAsFixed(3),
                              style: Theme.of(context).textTheme.displaySmall,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        Text(widget.secondUnitName),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(widget.firstUnitName),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
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
                }),
          ),
        ),

        Text(widget.secondUnitName),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            // controller: TextEditingController(text: centimeters.toString()),
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
                }),
          ),
        ),
      ],
    );
  }
}
