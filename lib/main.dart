import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_raiz/heroes_controller.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

//https://www.youtube.com/watch?v=5KIRXuRR9bk Link para video explicativo Provider Gerencia de estados

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Array de providers, provider sempre englobando o materialApp para poder resgatar/recuperar em qualquer lugar da aplicação
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroesController>.value(
          value: HeroesController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeWidget(),
      ),
    );
  }
}
