import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final int  time;
  final Widget childs;
  final double context_width;
  const FadeAnimation(this.time, this.childs, this.context_width);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}


class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, 
    duration: Duration(milliseconds: widget.time)
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.fastOutSlowIn)
    );
    _animationController!.forward();
    super.initState();
  }
  @override
  void dispose() {
   _animationController!.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController!, builder:(context, child) {
      return Transform(
        transform: Matrix4.translationValues(
          0.0, -_animation!.value * widget.context_width, 0.0, ),
        child: widget.childs,
      );
    },);
  }
}
