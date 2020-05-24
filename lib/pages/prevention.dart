import 'package:covid19info/pages/symptom.dart';
import 'package:flutter/material.dart';

class PreventionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preventions'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PreventionPages(),
          ],
        ),
      ),  
    );
  }
}