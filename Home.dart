import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';


import 'Biblioteca.dart';
import 'EmAlta.dart';
import 'Inicio.dart';
import 'Inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String? _resultado = "";

  @override
  Widget build(BuildContext context) {



    List<Widget> telas = [
      Inicio(_resultado!),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[

          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate()
              );
              setState(() {
                _resultado = res;
              });
            },
            icon: Icon(Icons.search),
          ),

          /*
          IconButton(
            onPressed: () {
              print("ação videocam");
            },
            icon: Icon(Icons.videocam),
          ),

          IconButton(
            onPressed: () {
              print("ação conta");
            },
            icon: Icon(Icons.account_circle),
          )
          */

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
             // backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
             // backgroundColor: Colors.green,
              label: "Biblioteca",
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}
