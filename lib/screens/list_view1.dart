import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {

  final opciones = const[
    'Korn','System Of A Down','Mudvayne','Slipknot','Limp Bizkit','Tool'];
   
  const ListView1Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Version 1'),
        elevation: 5,
      ),
      body: ListView(
        children: [
          ...opciones.map(
            (e) => ListTile(
              leading: Icon(Icons.rocket_launch),
              title: Text(e),
              trailing: Icon(Icons.arrow_back),
            )
            )
          /*ListTile(
            leading: Icon(Icons.check_box),
            title: Text('Listado nuevo numero 1'),
          )*/
        ],
      )
    );
  }
}