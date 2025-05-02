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
            title: const Text("Inch - Centimeters"),
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: const Text("Inch - Centimeters"),
                          ),
                          body: InchCentimeter(),
                        );
                      },
                    ),
                  ),
                },
          ),
          ListTile(
            title: const Text("Pound - Kilogram"),
            onTap:
                () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: const Text("Pound - Kilogram")),
                          body: Text("Item 2 body"),
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
                          body: Text("Item 3 body"),
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

class InchCentimeter extends StatefulWidget {
  const InchCentimeter({super.key});
  @override
  State<InchCentimeter> createState() => _InchCentimeterState();
}

class _InchCentimeterState extends State<InchCentimeter> {
  double inches = 0;
  double centimeters = 0;
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
                              inches.toStringAsFixed(3),
                              style: Theme.of(context).textTheme.displaySmall,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        Text("Inches"),
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
                              centimeters.toStringAsFixed(3),
                              style: Theme.of(context).textTheme.displaySmall,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                        Text("Centimeters"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            // controller: TextEditingController(text: inches.toString()),
            decoration: InputDecoration(hintText: "1", helperText: "Inches"),
            onChanged:
                (newInches) => setState(() {
                  try {
                    inches = double.parse(newInches);
                    errMsg1 = "";
                  } catch (err) {
                    errMsg1 = "Must be a valid number";
                    inches = 0;
                  }
                  centimeters = inches * 2.54;
                }),
          ),
        ),
        Text(errMsg1),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            // controller: TextEditingController(text: centimeters.toString()),
            decoration: InputDecoration(
              hintText: "2.54",
              helperText: "Centimeters",
            ),
            onChanged:
                (newCentimeters) => setState(() {
                  try {
                    centimeters = double.parse(newCentimeters);
                    errMsg2 = "";
                  } catch (err) {
                    errMsg2 = "Must be a valid number";
                    inches = 0;
                  }
                  inches = centimeters / 2.54;
                }),
          ),
        ),
        Text(errMsg2),
      ],
    );
  }
}
