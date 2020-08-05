import 'package:flutter/cupertino.dart';
import 'package:provider_raiz/hero_model.dart';

//Changenotifier vai permitir toda vez que houver uma alteração/chamar determinado metodo, ele notifica o consumer
//que houve alteração
class HeroesController extends ChangeNotifier {
  //Lista do tipo HeroModel ou seja, cada elemento desta lista ira/podera ter os atributos contidos em HeroModel
  List<HeroModel> heroes = [
    HeroModel(
        name: "Thor",
        urlImage:
            "https://kanto.legiaodosherois.com.br/w760-h398-gnw-cfill-q80/wp-content/uploads/2019/11/legiao_7Rn5yMXUptNzr1oQGw9b_gkeuvmaAH063FjiKIEcDC.png.jpeg"),
    HeroModel(
        name: "Ironman",
        urlImage:
            "https://d2skuhm0vrry40.cloudfront.net/2019/articles/2019-03-25-21-05/iron-man-vr-anunciado-para-playstation-vr-1553547920113.jpg/EG11/thumbnail/750x422/format/jpg/quality/60"),
    HeroModel(
        name: "Batman",
        urlImage:
            "https://swimchannel.net/wp-content/uploads/2019/02/Batman_capa.jpg"),
    HeroModel(
        name: "Capitão America",
        urlImage:
            "https://poltronanerd.com.br/wp-content/uploads/2019/05/poltrona-film-avengers-writers.jpg"),
    HeroModel(
        name: "Super Man",
        urlImage:
            "https://www.einerd.com.br/wp-content/uploads/2019/09/Superman-capa-890x466.jpg"),
  ];

  checkFavorite(HeroModel model) {
    //Muda o booleano isFavorite para ser o inverso, ou seja se é true vira false e vice-versa
    model.isFavorite = !model.isFavorite;
    //Momento em que for feita a alteração acima em isFavorite, o notifyListeners ira notificar o consumer e alterar
    notifyListeners();
  }
}
