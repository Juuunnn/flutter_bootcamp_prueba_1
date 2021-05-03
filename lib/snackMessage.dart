import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  void snacMessage({
    required final String message,
    required final BuildContext context, 
    final bool isError = false})
    {
    final SnackBar snackBar = SnackBar(
      duration: Duration(seconds: isError ? 4 : 1),
      backgroundColor: isError ? Colors.red : Colors.green,
        content: Text("$message", 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold)),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



