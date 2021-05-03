import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example4 extends StatefulWidget {
  @override
  _Example4State createState() => _Example4State();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String _name ="";
String _nameSaved ="";


Widget _body(){
      return Column(children: [
          Text("${(_nameSaved == null ) ? "no data" : _nameSaved}"), 
          _foreName()
          
        ]
        );
}  



Widget _appBar(){
      return AppBar(
          title: Text("Example 4"),);
  }  


Widget _inputName(){
  return Container(child: TextFormField(keyboardType: TextInputType.name,
  onSaved: (val) => _name = val ?? "",
  style: TextStyle(fontWeight: FontWeight.bold),
  validator: (val) => (val != null && val.length>5)? null : "issue in Name",
  ),);
}



Widget _foreName(){
  return Fore(Key(value))
}


Widget _fabSaveForm(){
  return FloatingActionButton.extended(onPressed: _saveDataForm(), 
  label: Text("Save Form"), 
  icon: Icon(Icons.add),);
}

@override
void initState(){
  _readData();

}






class _Example4State extends State<Example4> {
 /* @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(), 
      body: _body(),
      floatingActionButton: _fabSaveForm(),
    );
  }
}




void _saveDataForm() async{
  final FormState?  _formState = _formKey.currentState;
  if (_formState != null && _formState.validate()){
    _formState.save();
    try{
      await _writeData(value: _name);
      snackMessage(message: "savvveees", context: context);
    catch(error){}
  }else{
    snackMessage (message: "${(error.toString()), context: context, isError: true}"
  }
}





void _readData() async{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
    _nameSaved = preferences.getString("Name");
  //String? data= preferences.getString("name");
}

void _writeData() async{
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("name", value);
}





//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


import 'package:com_example/methods/public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example4page extends StatefulWidget {
  Example4page({Key key}) : super(key: key);

  @override
  _Example4pageState createState() => _Example4pageState();
}

class _Example4pageState extends State<Example4page> {
  int _number;
  final GlobalKey<FormState>_formkey= GlobalKey<FormState>();

  String _name = "";
  String _nameSaved;
  
  Widget _inputName(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name ,
        onSaved: (val) => _name = val ?? "",
        validator: (val) => (val != null && val.length > 5 )? null : "Issue in Name",
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixIcon: Icon(Icons.person),
          labelText: "Name",
          hintText: "Enter ur NAme"

        ),
      ),
    );
  }
    Widget _appBar(){
    return AppBar(
        title: Text("Example 4"),
    );
  }
  Widget _formName(){
    return Form(key: _formkey,child: Column(children: [_inputName()],),);
  }

    Widget _body(){
      return Column(children: [
        Text("${(_nameSaved == null) ? "NO data":_nameSaved}"),
        _formName()
      ],);

    }

  Widget _fabSaveForm(){
    return FloatingActionButton.extended(
      onPressed: _saveDataForm, 
      label: Text("Increment"),
      icon: Icon(Icons.exposure_plus_1),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _fabSaveForm() ,
    );
    
  }


void _saveDataForm()async{
  final FormState _formState = _formkey.currentState;
  if (_formState != null && _formState.validate()){
    _formState.save();
    await _writeData(value: _name);
    snacMessage(message: "Save :D",context: context);


  }else{
        snacMessage(message: "issue inside the form",context: context, isError: true);

  }

}


void initState(){
  _readData();
  super.initState();
}
  void _readData()async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    _nameSaved = preferences.getString("Name");
    setState(() {
      
    });

  }

  Future<void> _writeData({ final String value})async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("Name", value);
  }

}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Vercion correcta, revisar cual es el problema





//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< en un documento diferente

void snackMessage({required final String message, required final BuildContext context, final bool isError = false}){
  final SnackBar snackBar = SnackBar(
    duration: Duration(seconds: isError > 4 : 1),
    backgroundColor: isError ? Colors.red : Colors.green,
      content: Text("$message", 
        style: TextStyle(
          color: Colors.white, 
          fontWeight: FontWeight.bold)),);
    scaffoldMessage.of (context).showSnakBar(snackBar);
}





