import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('Soy un título de prueba'),
            subtitle: Text('Esto sería un párrafo para mi tarjeta'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){}, child: Text('Aceptar')),
                TextButton(onPressed: (){}, child: Text('Terminar'))
              ],
            ),
          )
        ],
      ),
    );
  }
}