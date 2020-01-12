import 'package:app_youtube/api.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    Api api = new Api();
    api.pesquisar();
    return Center(
      child: Text("Início"),
    );
  }
}
