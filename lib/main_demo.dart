import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Toggle Down')),
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
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: _toggle,
              child: Container(
                width: 100,
                height: 50,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  'Toggle Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),


        Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: _isToggled ? 200 : 0,
              child: _isToggled
                  ? Transform.translate(
                offset: Offset(0, 0),
                child: Container(
                  // width: 100,
                  // height: 100,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    'Additional Content',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
                  : Container(),
            ),
            Text('ssss')

          ],
        ),
      ],
    );
  }
}