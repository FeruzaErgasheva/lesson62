// import 'package:flutter/material.dart';
// import 'package:lesson62/views/screens/external_animation.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ExternalAnimation(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lesson62/views/screens/clock.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clock',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Clock'),
        ),
        body: Clock(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: ClockPainter(dateTime: _dateTime),
        ),
      ),
    );
  }
}
