import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Michael Fernadez', style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            child: Text('MF'),
          )
        ],
      ),
      body: Center(
         child: CircleAvatar(
          maxRadius: 180,
          backgroundImage: NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhqi02yHyaSTmmdKJPsrX4rosGNEficf0UtPrzJiXRF8uXAsWHabbU13s539mjRPqmCZ4YvupfTXW99atii0GM7XvKtQ7LMUZgZKuL3jPxZ6MRJL1zEBpQXWHiTBChCXLmu7D0XRsxpwFZv/s1600/post.bmp'),
        ),
      ),
    );
  }
}