import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Linear Toggle')),
        body: Center(
          child: ToggleWidget(),
        ),
      ),
    );
  }
}

class ToggleWidget extends StatefulWidget {
  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool _isToggled = false;

  void _toggle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: _isToggled ? Colors.blue : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: _isToggled ? 50 : 0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isToggled ? 1 : 0,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'ON',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: _isToggled ? 0 : 50,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _isToggled ? 0 : 1,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'OFF',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}