import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_prueba_1/Day_3/uris.dart';
import 'package:flutter_bootcamp_prueba_1/snackMessage.dart';



//Asignando todas las propiedades que estan en el paquete a la variable http
//cuidado de que no se utilize la misma vairable dentro de la clase
import 'package:http/http.dart' as http;

import '../snackMessage.dart';


class Example3 extends StatefulWidget {
  
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example3> {
    int _number =0;
    
    List<int>_list=[];

    AppBar _appBar(){
    return AppBar(title: Text("example"));
    }  
    Widget _body(){
      if  (_list.isEmpty){
        return Container(
          child: Center(
            child: Text("no data", 
            style: TextStyle(fontSize: 30, color: Colors.grey),),));
        }
      return ListView(
        children: _list.map((food) => Text("${food.toString}")).toList());  
    }  

    @override
    void initState() {
      _loadDataFromServer();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: _appBar(),
        body: _body(),
      );
    }


  void _loadDataFromServer() async{
    try{
    http.Response _response = await http.get(Uri.parse(Uris().foodsApi), 
      headers: {"content-type": "aplication/json"}).timeout(Duration(seconds:20));
      if(_response.statusCode == 200){
        _list = await json.decode(utf8.decode(_response.bodyBytes));
      }
    }catch(error){
      snacMessage(message: "${error.toString()}", context: context, isError: true);
    }
  }
}




