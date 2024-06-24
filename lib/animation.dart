import 'package:flutter/material.dart';

class ExternalAnimation extends StatefulWidget {
  const ExternalAnimation({Key? key}) : super(key: key);

  @override
  State<ExternalAnimation> createState() => _ExternalAnimationState();
}

class _ExternalAnimationState extends State<ExternalAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _containerAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _containerAnimation = Tween<double>(begin: 0, end: 300).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Optional: Add a listener to trigger rebuild when animation value changes
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tashqi animatsiyalar"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${_containerAnimation.value.toInt().toString()}%"),
          Center(
            child: AnimatedBuilder(
              animation: _containerAnimation,
              builder: (context, child) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: _containerAnimation.value,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.repeat(reverse: true);
          
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
