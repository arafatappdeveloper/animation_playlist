import 'package:flutter/material.dart';

class AnimationExam4 extends StatefulWidget {
  const AnimationExam4({super.key});

  @override
  State<AnimationExam4> createState() => _AnimationExam4State();
}

class _AnimationExam4State extends State<AnimationExam4> with SingleTickerProviderStateMixin{
  late AnimationController _controller;//late means value kkhno null hbe na
  late List<Animation<Offset>> _animations;
  bool _menuvisible= false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();// প্যারেন্ট ক্লাসের initState() কল করা হচ্ছে
     _controller=AnimationController(
         vsync: this,//অ্যানিমেশনকে অপটিমাইজ করতে vsync সরবরাহ করে।
       duration: Duration(seconds: 2),
         );

    _animations = List.generate(5,
            (index)=>Tween<Offset>(begin: Offset(0,1),
            end: Offset.zero
            ).animate(CurvedAnimation(
                parent: _controller,
                curve: Interval(index*0.2,1.0, curve: Curves.elasticOut))));

   }
  void _toggleMenu(){
    setState(() {
      _menuvisible=!_menuvisible;
      _menuvisible ? _controller.forward() : _controller.reverse();
    });
  }
@override
  void dispose() {
    // TODO: implement dispose
  _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animation Example Four '),
      ),
       body: Center(
         child: Column(
           children:List.generate(5, (index)=>
               SlideTransition(
                   position: _animations[index],
               child: Text('Menu Item ${index + 1}')))
         ),
       ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            _toggleMenu();
          },
        child:Icon(_menuvisible ? Icons.close : Icons.menu), ),
    );
  }
}
