import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Example2 extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example2> {
  int _number =0;
  
  AppBar _appBar(){
	return AppBar(title: Text("example"));
	}  
  Widget _body(){
	return Container(child: Center(child: Text("hello world $_number", style: TextStyle(fontSize: 30, color: Colors.blue),),));
	}  
  Widget _fabIncrement(){
return FloatingActionButton.extended(onPressed: _incrementNumber, label: Text("Increment"),icon: Icon(Icons.exposure_plus_1),);
  }
  Widget _fabDecrement(){
return FloatingActionButton.extended(onPressed:_decrementNumber, label: Text("Decrement"),icon: Icon(Icons.exposure_minus_1),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
	    body: _body(),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [_fabIncrement(), _fabDecrement()],) 
    );
  }

  void _incrementNumber(){
    _number++;
    setState((){});
  }

  void _decrementNumber(){
    _number--;
    setState((){});
  }
}
