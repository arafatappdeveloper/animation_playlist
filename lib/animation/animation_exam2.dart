import 'package:flutter/material.dart';

class AnimationExam2 extends StatefulWidget {
  const AnimationExam2({super.key});

  @override
  State<AnimationExam2> createState() => _AnimationExam2State();
}

class _AnimationExam2State extends State<AnimationExam2> {
  bool _toggle=true;

  void _taptoggle(){
    setState(() {
      _toggle =!_toggle;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _taptoggle();
          },
      child: Icon(Icons.play_arrow_sharp),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animation Example Two '),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedCrossFade(
                firstChild: Container(
                  height: 100,
                    width: 200,
                    color: Colors.limeAccent,
                    child: Center(child: Text('Hello Arafat'))),
                secondChild: Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text('Flutter Developer?'))),
                crossFadeState: _toggle?CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: Duration(seconds: 2)),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedSwitcher(
            child:Container(
                height: 100,
                width: 200,
                color: Colors.purpleAccent,
                child: Center(
                    child:_toggle? Text('Hello Arafat'):Text('Hire me now '))),
            switchInCurve: Curves.easeInOutExpo,
              switchOutCurve: Curves.bounceInOut,
             transitionBuilder: (Widget child, Animation<double> animation){
              return ScaleTransition(scale: animation,child: child,);
             },
              duration: Duration(seconds: 2)),
          SizedBox(
            height: 20,
          ),
          Hero(
              tag: 'arafat',
              child: Image.asset('images/assets/th.png')),
        ],
      ),
    );
  }
}
