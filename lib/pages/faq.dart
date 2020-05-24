import 'package:covid19info/datasource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ's"
        ),
      ),
      body: ListView.builder(
        itemCount: DataSource.questionAnswers.length,
        itemBuilder: (context, index) =>
        ExpansionTile(
          title: Text(DataSource.questionAnswers[index]['question'],style: GoogleFonts.pavanam(fontWeight: FontWeight.bold, fontSize: 20, ),),
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(DataSource.questionAnswers[index]['answer']),
            )
          ],
        ),
      )  
    );
  }
}

