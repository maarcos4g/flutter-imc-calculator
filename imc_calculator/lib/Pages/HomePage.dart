import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
           _infoText = "Informe seus dados!";
        });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.5) {
        _infoText = "Magreza! (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc < 24.9) {
        _infoText = "Seu IMC está normal! (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Sobrepeso! (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 39.9) {
        _infoText = "Obesidade! (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 39.9) {
        _infoText = "Obesidade grave! (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0), //10.0, 0.0 e etc.
          child: Column(
            children: <Widget>[
              Icon(Icons.person_outline,
                  size: 120.0, color: Colors.purple[800]),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Seu Peso (kg)",
                    labelStyle: TextStyle(fontSize: 18.0)),
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Sua Altura (cm)",
                    labelStyle: TextStyle(fontSize: 18.0)),
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: Colors.purple[800],
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
