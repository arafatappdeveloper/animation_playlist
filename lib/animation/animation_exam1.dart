import 'dart:math';

import 'package:flutter/material.dart';

class AnimationExam1 extends StatefulWidget {
  const AnimationExam1({super.key});

  @override
  State<AnimationExam1> createState() => _AnimationExam1State();
}

class _AnimationExam1State extends State<AnimationExam1> {
  final List<String> _nameList =['Arafat','Zaman' , 'Mithila', 'Happy 2024 '];
  int _currentIndex =0;
  //Random is a class //Nije nije data change kre nite pare
   final Random random= Random();
  double _height=100;
  double _weight=100;
  Color _color = Colors.lime;
  void _showNextName(){
    setState(() {
      _currentIndex=(_currentIndex+1) % _nameList.length;

      _height =random.nextInt(200).toDouble()+100;
      _weight =random.nextInt(200).toDouble()+100;
      _color= Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animation Example One '),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              AnimatedContainer(
                duration: Duration(seconds: 4),
                width: _weight,
                height: _height,
                curve: Curves.easeIn,
                color:  _color,
                child: Center(child: Text(_nameList[_currentIndex])),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: _showNextName,
        child: Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}
