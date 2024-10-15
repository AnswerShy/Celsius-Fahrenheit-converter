import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedScreen = 0;

  final List<Widget> _screens = [
    textFieldsWidget(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Celsius to fahrenheit", style: TextStyle(
            fontFamily: 'gochihand',
            fontSize: 64
          )),
          centerTitle: true,
        ),
        body: _screens[_selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "calculate",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "about",
            )
          ],
          currentIndex: _selectedScreen,
          onTap: (index) {
            setState(() {
              _selectedScreen = index;
            });
          },
        ),
      )
    );
  }

}

class textFieldsWidget extends StatefulWidget {
  const textFieldsWidget({super.key});

  @override
  _textFieldsWidget createState() => _textFieldsWidget();
}

class _textFieldsWidget extends State<textFieldsWidget>{
  TextEditingController _controllerCelsius = TextEditingController();
  TextEditingController _controllerFahrenheit = TextEditingController();

  void calcFromCelsiusToFahr(String value) {
    _controllerFahrenheit.clear();

    double? celsius = double.tryParse(_controllerCelsius.text);

    if(celsius != null) {
      double result = celsius * 1.8 + 32;
      _controllerFahrenheit.text = result.toStringAsFixed(2);
    }
  }
  void calcFromFahrToCelsius(String value) {
    _controllerCelsius.clear();

    double? fahrenheit = double.tryParse(_controllerFahrenheit.text);

    if(fahrenheit != null) {
      double result = (fahrenheit - 32) / 1.8;
      _controllerCelsius.text = result.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        TextField(
          controller: _controllerCelsius,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter Celsius',
            border: OutlineInputBorder(),
          ),
          onChanged: calcFromCelsiusToFahr,
        ),
        SizedBox(height: 10),
        TextField(
          controller: _controllerFahrenheit,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter Fahrenheit',
            border: OutlineInputBorder(),
          ),
          onChanged: calcFromFahrToCelsius,
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Text(
        "Panka Kyrylo",
        style: TextStyle(
          fontFamily: "gochihand",
          fontSize: 64,
        ),
      ),
    );
  }
}