import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleTarea extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<ExampleTarea> {
  int _number = 0;

//Agregue una variable que se encargara de dictar el color del texto
//esta variable es unicamente manipulada por la funcion  _evenOrOddCheck()
  Color Cols = Colors.blue;

  AppBar _appBar() {
    return AppBar(title: Text("example"));
  }

  Widget _body() {
    return Container(
        child: Center(
      child: Text(
        "hello world $_number",
        style: TextStyle(fontSize: 30, color: Cols),
        // _number.is no de que ? then colors.blue else Colors.red;
      ),
    ));
  }

  Widget _fabIncrement() {
    return FloatingActionButton.extended(
      onPressed: _incrementNumber,
      label: Text("Increment"),
      icon: Icon(Icons.exposure_plus_1),
    );
  }

  Widget _fabDecrement() {
    return FloatingActionButton.extended(
      onPressed: _decrementNumber,
      label: Text("Decrement"),
      icon: Icon(Icons.exposure_minus_1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _body(),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_fabIncrement(), _fabDecrement()],
        ));
  }

  void _incrementNumber() {
    _number++;
    _evenOrOddCheck();
    setState(() {});
  }

  void _decrementNumber() {
    _number--;
    _evenOrOddCheck();
    setState(() {});
  }

  //lo hice en una linea por los loles... "spoilers"
  void _evenOrOddCheck() {
    if ((_number % 2) > 0)
      Cols = Colors.red;
    else
      Cols = Colors.blue;
  }
}
