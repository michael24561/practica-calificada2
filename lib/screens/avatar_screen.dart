import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Walter Moncada', style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            child: Text('WM'),
          )
        ],
      ),
      body: Center(
         child: CircleAvatar(
          maxRadius: 180,
          backgroundImage: NetworkImage('https://www.google.com/imgres?q=anime&imgurl=https%3A%2F%2Ft3.ftcdn.net%2Fjpg%2F04%2F49%2F19%2F08%2F360_F_449190831_i2whvIQdDIGtuIVWT6QfenWwmRApVJ5l.jpg&imgrefurl=https%3A%2F%2Fstock.adobe.com%2Fes%2Fsearch%3Fk%3Danime&docid=P4HLIhpBk7Z8VM&tbnid=USFzA8bqtpFTWM&vet=12ahUKEwjYyMXUnY6OAxW3HrkGHSVrHvsQM3oECH0QAA..i&w=640&h=360&hcb=2&ved=2ahUKEwjYyMXUnY6OAxW3HrkGHSVrHvsQM3oECH0QAA'),
        ),
      ),
    );
  }
}