import 'package:fl_componentes/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType3 extends StatelessWidget {

  final String imageURL;
  final String? descripcion;

  const CustomCardType3({
    super.key, required this.imageURL, this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
        ),
      shadowColor: AppTheme.primario,
      elevation: 10,
      child: Column(
        children: [
          /*Image(
            image:NetworkImage('https://elcomercio.pe/resizer/v2/USJCPLIGHNGWJCY72IBC7YBKDA.jpg?auth=9a2a7d697fe6a3021a42c1bfafa0bc74f42b7dd36e49057c2fbe6ed1e2d759f1&width=980&height=528&quality=75&smart=true')
            ),*/
          FadeInImage(
            placeholder: AssetImage('assets/loading_gif.gif'), 
            image: NetworkImage(imageURL),
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 300),
            ),
          if(descripcion != null)
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 30, top: 10, bottom: 10),
            child: Text(descripcion ?? 'no.tittle'),
          )
        ],
      ),
    );
  }
}