import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infotext = "pode entrar!";
  void _changePeople(int delta){
    setState(() {
    _people += delta;
    if(_people < 0) {
      _infotext = "Mundo invertido?";

    }
    else if (_people <= 10) {
      _infotext = "Pode Entrar";
    }
    else {
      _infotext = "Lotado";
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/original.jpg",
        fit: BoxFit.cover,
        height: 1000,
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text(
          "Pessoas: $_people",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
                onPressed: () {
                  _changePeople(1);
                },
                child: Text("+1",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
                onPressed: () {
                  _changePeople(-1);
                },
                child: Text("-1",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
        ]),
        Text(
          _infotext,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ])
    ]);
  }
}
