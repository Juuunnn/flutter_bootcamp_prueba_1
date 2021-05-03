import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:*/Task.dart';


class Example5page extends StatefulWidget {
  @override
  _Example5pageState createState() => _Example5pageState();

}



class _Example5pageState extends State<Example5page> {

List<Task>? listTasks;


//>>>>>>>>>>>>>>>>>>>>>>>>copiado de ejercisio 4
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
//>>>>>>>>>>>>>>>>>ejer 4

AppBar _appBar(){
  return AppBar(title: Text("Example 5"));
}

Widget _body(){
  if (listTasks == null) {
    return Center(child: CirculationProgressIndicator());

  }else(listTasks!.isEmpty){
return Center(child: Text("no data"),)
  }
  return LastView (
    children: listTasks!.map((task) => Text("${task.name}")).toList());
}

Widget _fabToGoForm(){
  return floatingActionButton.extended(
    onPressed: () => Navigator.of(context);
        .push(materialPageRoute(builder: (context)=> ExampleIs5Form())
        .whenComplete(()=> _readDataFromeDB()), 
      label: Text("add Task")),
      icon: Icon(Icons.add);
  )
}





Widget _favSaveTask(){
  return floatingActionButton.extended()
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _formTask(),
      floatingActionButton: _favSaveTask()
    );
  }

void saveData() async{
  final  fromState? _formState = _formKey.currentState;
  if(_formSatate != null && _formState.validate()){
    _formState.save();
    try{
      Task _task=Task(name: _name, seconds int.tryParse(_seconds));
      await _insertDataToDB(_task);
      snackMessage(message: "saveeeeee", context: context);
      Navigator.of(context).pop();
    }catch(error){
      snackMessage(message: "${error.toString()}", context: context, isError: true);
    }
  }else{
    snackMessage(message: "issue inside the form", context: context, isError: true);
  }
}




  Widget _inputName(){
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.name ,
        validator: (val) => 
              (val != null && val.isNotEmpty && int.tryParse(val) != null )? null : "Issue in seconds",
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixIcon: Icon(Icons.person),
          labelText: "Name",
          hintText: "Enter ur NAme"

        ),
      ),
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

    void _readDataFromDB() async{
    final Database? db = await DatabaseHelper.db.database;
    List<dynamic>? results =await db!.query("task");
    if(results==null || results.isEmpty
    }















}













