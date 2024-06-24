import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson62/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeData _themeData = ThemeData.light();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ExternalAnimation(),
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
  Alignment alignment = Alignment.center;
  final key = GlobalKey();
  int _counter = 0;
  bool isBig = true;
  bool isVisible = true;
  bool _isHighlighted = false;
  Random _random = Random();
  bool isMoved = false;
  List _items = [
    "1",
    "1",
    "1",
    "1",
    "1",
  ];

  bool isFirst = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeAlignement() {
    double x = _random.nextDouble() * 2 - 1;
    double y = _random.nextDouble() * 2 - 1;

    setState(() {
      // isVisible = !isVisible;
      isBig = !isBig;
      _isHighlighted = !_isHighlighted;
      alignment = Alignment(x, y);
    });
  }

  void delete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedList(
        initialItemCount: 100,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text("sth"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
          );
        },
      ),
      // body: AnimatedSwitcher(
      //   duration: Duration(seconds: 1),
      //   child: isFirst
      //       ? Text("First")
      //       : Container(
      //           color: Colors.black,
      //           width: 200,
      //           height: 100,
      //         ),
      // ),
      // body: AnimatedCrossFade(
      //   firstChild: Container(
      //     color: Colors.black,
      //     width: 200,
      //     height: 100,
      //   ),
      //   secondChild: Text("something"),
      //   crossFadeState:
      //       isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      //   duration: Duration(milliseconds: 300),
      // ),
      // body: Stack(
      //   children: [
      //     AnimatedPositionedDirectional(
      //       height: 200,
      //       width: 200,
      //       start: isMoved ? 150 : 50,
      //       child: Container(
      //         color: Colors.blue,
      //       ),
      //       duration: Duration(seconds: 1),
      //     )
      //   ],
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       AnimatedOpacity(
      //         duration: Duration(seconds: 1),
      //         opacity: isVisible ? 1 : 0,
      //         child: AnimatedAlign(
      //           alignment: alignment,
      //           duration: Duration(seconds: 1),
      //           child: AnimatedPhysicalModel(
      //             borderRadius: BorderRadius.circular(20),
      //             color: Colors.white,
      //             elevation: isBig ? 10 : 2,
      //             duration: Duration(seconds: 1),
      //             shape: BoxShape.rectangle,
      //             shadowColor: Colors.black,
      //             child: AnimatedContainer(
      //               curve: Curves.bounceIn,
      //               duration: Duration(milliseconds: 500),
      //               width: isBig ? 200 : 100,
      //               color: isBig ? Colors.blue : Colors.red,
      //               height: isBig ? 200 : 100,
      //             ),
      //           ),
      //         ),
      //       ),
      //       AnimatedDefaultTextStyle(
      //         child: Text("Something"),
      //         style: _isHighlighted
      //             ? TextStyle(color: Colors.amber, fontSize: 18)
      //             : TextStyle(color: Colors.black, fontSize: 14),
      //         duration: Duration(seconds: 1),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isFirst = !isFirst;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
