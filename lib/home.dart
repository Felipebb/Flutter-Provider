import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_raiz/heroes_controller.dart';
import 'hero_model.dart';

class HomeWidget extends StatefulWidget {
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buidList(HeroesController heroesController) {
    //Recuperando items do HeroesController de outra forma, a recuperação abaixo pode ser feita em qualquer
    //parte da aplicação/código (recuperar sem precisar ser dentro do consumer)
    //nao precisaria receber como parametro no construtor o heroescontroller
    //HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      //ItemCount, quantos itens há na lista
      //Quantidade de itens na lista ira depender da quantidade de itens que esta contida em
      //HeroesController
      itemCount: heroesController.heroes.length,
      //ItemBuilder, o que ira construir de fato a lista.
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index], heroesController);
      },
    );
  }

  _buildItems(HeroModel model, HeroesController heroesController) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Card(
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(0,2,2,2),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(model.urlImage)),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Colors.redAccent,
                ),
              ),
            ),
            onTap: () {
              heroesController.checkFavorite(model);
            },
            title: Text(model.name),
            trailing: model.isFavorite
                ? Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : Icon(Icons.star_border),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 237, 29, 36),
        title: Text("Provider"),
      ),
      //consumer (recupera o provider para utilizar os dados)/ Consome um provider
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget) {
          return _buidList(heroesController);
        },
      ),
    );
  }
}
