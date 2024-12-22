import 'package:flutter/material.dart';

import 'animation_exam2.dart';
class AnimationExam3 extends StatefulWidget {
  const AnimationExam3({super.key});

  @override
  State<AnimationExam3> createState() => _AnimationExam3State();
}

class _AnimationExam3State extends State<AnimationExam3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animation Example Three '),
      ),

      body: Column(
        children: [

      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimationExam2()));
        },
        child: Hero(
            tag: 'arafat',
            child: Image.asset('images/assets/th.png')),
      )
        ],
      ),

    );
  }
}
