import 'package:equals/routes/commontools.dart';
import 'package:equals/routes/settings.dart';
import 'package:equals/routes/volume.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equals - Conversion Tool',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Equals - Conversion Tools'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Add AppBar Navigation
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("Loading...");
    switch (selectedIndex) {
      case 0:
        {
          currentWidgetPage = CommonToolsPage();
          break;
        }
      case 1:
        {
          currentWidgetPage = VolumePage();
          break;
        }
      case 2:
        {
          currentWidgetPage = SettingsPage();
          break;
        }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        // backgroundColor: Colors.amber,
        // Text("Wow", style: Theme.of(context).textTheme.headlineMedium),
        title: Text(widget.title),
      ),
      body: currentWidgetPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            (newIndex) => setState(() {
              selectedIndex = newIndex;
            }),
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.handyman), label: "Common"),
          BottomNavigationBarItem(icon: Icon(Icons.water), label: "Volume"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
