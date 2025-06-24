import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.amber;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  //CREACION DE UN MÉTODO
  void changeShape() {
    /*_width += 30;
    _height += 30;
    _color = Colors.blueAccent;
    _borderRadius = BorderRadius.circular(40);
    setState(() {});*/
    final rndm = Random();
    _width = rndm.nextInt(300).toDouble() + 50;
    _height = rndm.nextInt(300).toDouble() + 50;
    _color = Color.fromRGBO(
      rndm.nextInt(255),
      rndm.nextInt(255),
      rndm.nextInt(255),
      1);
      _borderRadius = BorderRadius.circular(rndm.nextInt(100).toDouble() + 5);
      setState(() {
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contenedor Animado',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.decelerate,
          width: _width,
          height: _height,
          //color: Colors.red,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: Icon(Icons.propane, color: Colors.white),
      ),
    );
  }
}
