import 'package:abasetabbar/PrimeiraPagina.dart';
import 'package:abasetabbar/SegundaPagina.dart';
import 'package:abasetabbar/TerceiraPagina.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin { //Para usar a tabController

  //Controller das paginas da tab
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Inicializar a tabController
    _tabController = TabController(
        length: 3, //Quantidades de abas terá
        vsync: this, //o this está associado ao SingleTickerProviderStateMixin
        initialIndex: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Descartar a controller quando não for mais utilizada
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),

        //Tabs de navegação na appBar
        bottom: TabBar(
          controller:  _tabController,
          tabs: <Widget>[

            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),

            Tab(
                text: "Email",
                icon: Icon(Icons.email),
            ),

            Tab(
                text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),

      //Conteúdo que será exibido nas tabs
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PrimeiraPagina(),
          SegundaPagina(),
          TerceiraPagina(),
        ],
      ),
    );
  }
}
