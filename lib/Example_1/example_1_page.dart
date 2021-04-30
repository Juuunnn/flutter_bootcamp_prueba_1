import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  AppBar _appBar(){
	return AppBar(title: Text("example"));
	}  
  Widget _body(){
	return Container(child: Text("hello world", style: TextStyle(fontSize: 30, color: Colors.blue),),);
	}  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("hellllllllooo") ),
      appBar: _appBar(),
	    body: _body(),
    );
  }
}
