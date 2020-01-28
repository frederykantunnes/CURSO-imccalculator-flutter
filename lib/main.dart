
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "IMC",
    home: Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<FormState> _formKey = GlobalKey <FormState>();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  String info = "";
  void calcular(){
      setState(() {
        double result = double.parse(peso.text) / (double.parse(altura.text) * double.parse(altura.text));
        info = "Seu IMC é: " + result.toStringAsPrecision(4);
      });
  }

  void _resert(){
    setState(() {
      info = "";
    });
    peso.text = "";
    altura.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resert,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_pin, size: 120, color: Colors.green,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  validator: (value){
                    if(value.isEmpty){return "Insira Seu Peso";}},
                  style: TextStyle( color: Colors.green, fontSize: 25.0),
                  controller: peso,
                  decoration: new InputDecoration(
                      labelText: "Peso em Kg",
                      labelStyle: TextStyle( color: Colors.green),
                      border: OutlineInputBorder()
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child:
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle( color: Colors.green, fontSize: 25.0),
                    controller: altura,
                    validator: (value){
                      if(value.isEmpty){
                        return "Insira Sua Altura";
                      }
                    },
                    decoration: new InputDecoration(
                        labelText: "Altura em cm",
                        labelStyle: TextStyle( color: Colors.green),
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        calcular();
                      }
                    },
                    color: Colors.green,
                    child: Text("Calcular", style: TextStyle(color: Colors.white),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    info,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30.0
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
