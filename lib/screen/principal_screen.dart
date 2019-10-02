import 'package:flutter/material.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _informacao = "Informe seus dados!";

  void _resetarCampos() {
    //apartir do momento que altero a tela atualiza
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _informacao = "Informe seus dados!";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _informacao = "Abaixo do Peso ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 18.6 && imc < 24.9) {
        _informacao = "Peso Ideal ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 24.9 && imc < 29.9) {
        _informacao = "Levemente Acima do Peso ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 29.9 && imc < 34.9) {
        _informacao = "Obesidade Grau I ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 34.9 && imc < 39.9) {
        _informacao = "Obesidade Grau II ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 40.0) {
        _informacao = "Obesidade Grau III ${imc.toStringAsPrecision(3)}!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Imc"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: _resetarCampos,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //toda a largura da coluna
            children: <Widget>[
              Icon(
                Icons.person,
                size: 120.0,
                color: Colors.green,
              ),
              TextFormField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                //cor da decoração do label
                decoration: InputDecoration(
                  //adicionar decoração ao campo
                  labelText: "Peso em (kg)",
                  labelStyle: TextStyle(color: Colors.redAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25.0,
                ),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Insira o seu Peso";
                  }
                },
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,
                //cor da decoração do label
                decoration: InputDecoration(
                  //adicionar decoração ao campo
                  labelText: "Altura em (cm)",
                  labelStyle: TextStyle(color: Colors.redAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 25.0,
                ),
                validator: (valor) {
                  if (valor.isEmpty) {
                    return "Insira a sua Altura";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.0,
                      ),
                    ),
                    color: Colors.yellow, //cor de fundo do botão
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calcular();
                      }
                    },
                  ),
                ),
              ),
              Text(
                _informacao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
