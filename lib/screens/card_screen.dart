import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Widget', style: TextStyle(color: Colors.white)),
      ) ,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(),
          SizedBox(height: 20),
          CustomCardType3(
            imageURL: 'https://noticias.imer.mx/wp-content/uploads/2024/05/Dragon-Ball-Goku.jpg',
            descripcion: 'Goku Version 1',
            ),
          CustomCardType2(),
          CustomCardType1(),
          CustomCardType3(imageURL: 'https://libero.cronosmedia.glr.pe/original/2022/09/09/631bb2d0dd4ed9264b10e024.jpg',),
          CustomCardType1(),
          CustomCardType2(),
        ],
      ),
    );
  }
}

