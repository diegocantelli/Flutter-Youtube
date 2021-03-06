import 'package:app_youtube/custom_search_delegate.dart';
import 'package:app_youtube/telas/biblioteca.dart';
import 'package:app_youtube/telas/em_alta.dart';
import 'package:app_youtube/telas/inicio.dart';
import 'package:app_youtube/telas/inscricoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      //Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black87,
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          )
        ],
      ),
    );
  }
}
