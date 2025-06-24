import 'package:fl_componentes/router/app_routes.dart';
import 'package:fl_componentes/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: ListView2Screen(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute:AppRoutes.onGenerateRoute,
      theme: AppTheme.firsTheme,
      /*theme: ThemeData.light().copyWith(
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(color: Colors.red)
      )*/
    );
  }
}
