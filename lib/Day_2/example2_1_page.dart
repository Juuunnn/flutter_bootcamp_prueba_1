import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Example3 extends StatefulWidget {
  /*
  //pedaso de codigo que me hiso falta implementar
  Example3({Key key}) : super(key: key);
  */
  
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
      children:_list.map((_number) => _customItem(numberItem: _number)).toList()
    );  
  }  

  Widget _fabAddNumber(){
    return FloatingActionButton.extended(
      onPressed: _addSomeNumber, 
      label: Text("Add Number"), 
      icon: Icon(Icons.add),
      );
  }
  
  Widget _customItem({required final int numberItem}){
    return ListTile(title: Text("$numberItem"), onTap: () => _onTapItem(removeNumber: numberItem));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
	    body: _body(),
      floatingActionButton:_fabAddNumber(), 
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar : _appbar(),
      body:_body(),
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _flaIncrement(),
          SizedBox(height: 10,),
        ],
      ) ,
    );
  }

  void _addSomeNumber(){
    _list.add(Random().nextInt(99999));
    setState((){});
  }

  void _onTapItem({required final int removeNumber}){
    _list.remove(removeNumber);
    setState(){};
  }


}







//import 'package:flutter/material.dart';
/*
class Example3Page extends StatefulWidget {
  Example3Page({Key key}) : super(key: key);

  @override
  _Example3PageState createState() => _Example3PageState();
}

class _Example3PageState extends State<Example3Page> {
  int _number= 0;
  List<int> _list = [];
  int residue;
  Color _colorText;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : _appbar(),
      body:_body(),
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _flaIncrement(),
          SizedBox(height: 10,),
        ],
      ) ,
    );
  }

  AppBar _appbar(){
    return AppBar(title: Text("Example 3"),);
  }

  Widget _body(){
    if(_list.isEmpty)
    return Container(
      child: Center(
                    child: Text("Number: $_number",
                  style:TextStyle( fontSize: 45,color: _colorText, ),
            ),
      ),
    );


    return ListView(
      children: _list.map((_number) => Text("$_number")).toList()
    );

  }


    Widget _flaIncrement(){
    return FloatingActionButton.extended(
      onPressed: _incrementNumber, 
      label: Text("Increment"),
      icon: Icon(Icons.exposure_plus_1),
    );

  }

  void _incrementNumber(){
  _number++;
  residue = _number % 2 ;
    residue == 0  ? _colorText= Colors.red :_colorText= Colors.blue; 
  setState(() {

  });
} 
}*/