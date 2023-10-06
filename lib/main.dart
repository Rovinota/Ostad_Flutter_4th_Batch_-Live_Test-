import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ButtonScreen(),
    );
  }
}

class ButtonScreen extends StatefulWidget {
  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  int _selectedButtonIndex = -1; // Index of the selected button

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  Widget _buildButton(String label, int index) {
    bool isSelected = index == _selectedButtonIndex;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index; // Set the selected button index
          for (int i = 0; i < 6; i++) {
            if (i != index) {
              // Reset color of previously selected button
              _buttons[i] = _defaultColor;
            }
          }
          _buttons[index] = isSelected ? _defaultColor : _selectedColor; // Change button color
          _showSnackbar('Selected Size: $label'); // Show Snackbar
        });
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttons[index], // Set button color dynamically
        foregroundColor: Colors.white,
      ),
    );
  }

  final List<Color> _buttons = List.filled(6, _defaultColor); // List to store button colors
  static const Color _defaultColor = Colors.blue; // Default button color
  static const Color _selectedColor = Colors.amber; // Selected button color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('S', 0),
                _buildButton('M', 1),
                _buildButton('L', 2),
                _buildButton('XL', 3),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: _buildButton('XL', 4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: _buildButton('XXL', 5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}