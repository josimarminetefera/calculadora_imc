import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //deverá ser utilizado pelo formulario
  GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _infoTeste = "Informe seus dados!";

  void _resetarCampos() {
    //apartir do momento que altero a tela atualiza
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _infoTeste = "Informe seus dados!";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoTeste = "Abaixo do Peso ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoTeste = "Peso Ideal ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoTeste = "Levemente Acima do Peso ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoTeste = "Obesidade Grau I ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoTeste = "Obesidade Grau II ${imc.toStringAsPrecision(3)}!";
      } else if (imc >= 40.0) {
        _infoTeste = "Obesidade Grau III ${imc.toStringAsPrecision(3)}!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //da facilidades para adicionar widgets
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {
              _resetarCampos();
            },
          )
        ],
      ),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        //barra de rolagem

        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          //formulario

          key: _formularioKey,

          child: Column(
            //alinhamento contrario ao principal que é vertical
            crossAxisAlignment: CrossAxisAlignment.stretch, //preenche toda a largura

            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.purpleAccent,
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

                //cor do texto
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),

                validator: (valor) {
                  //valor do meu campo digitado
                  if (valor.isEmpty) {
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                controller: alturaController,
                keyboardType: TextInputType.number,

                //cor da decoração do label
                decoration: InputDecoration(
                  //adicionar decoração ao campo
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                ),

                //cor do texto
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purpleAccent, fontSize: 25.0),

                validator: (valor) {
                  //valor do meu campo digitado
                  if (valor.isEmpty) {
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0), //borda para o botão

                child: Container(
                  //para especificar o tamanho do botão
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.purpleAccent, //cor de fundo do botão
                    onPressed: () {
                      if (_formularioKey.currentState.validate()) {
                        _calcular();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0), //borda para o botão

                child: Container(
                  //para especificar o tamanho do botão
                  height: 50.0,
                  child: RaisedButton(
                    child: Text(
                      "Nova",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                    color: Colors.yellow, //cor de fundo do botão
                    onPressed: () {},
                  ),
                ),
              ),
              Text(
                _infoTeste,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purpleAccent, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
