import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Symptom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms'),
      ),
      body: 
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height:15.0),
              SymptomsPanel(
                title: "COUGH",
                flags: "assets/symptoms/cough.png",
                size: 20.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "HIGH FEVER",
                flags: "assets/symptoms/fever.png",
                size: 20.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "SHORTNESS IN BREATH",
                flags: "assets/symptoms/shortnessinbreathe.png",
                size: 20.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "HEADACHE",
                flags: "assets/symptoms/headache.png",
                size: 20.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "VOMITING",
                flags: "assets/symptoms/vomiting.png",
                size: 20.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "DIARROHEA",
                flags: "assets/symptoms/diarrohea.png",
                size: 20.0,
              ), 
              SizedBox(height:20.0),
            ],
          ),
        ),
    );
  }
}

class SymptomsPanel extends StatelessWidget {

  final String title;
  final String flags;
  final double size;


  const SymptomsPanel({Key key, this.title, this.flags, this.size}) : super(key: key);@override

 
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 20.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(flags, height: 150,),
          Container(
            child: Text(
              title,
              style: GoogleFonts.pangolin(
                textStyle: TextStyle(
                  fontSize: size, 
                  fontWeight: FontWeight.bold,
                  letterSpacing:1.5,
                  color: Colors.white54,
                ),
              ),
            ),
          ), 
          SizedBox(width: 0.0),
        ],
      ),
    );
  }
}


class PreventionPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SymptomsPanel(
                title: "WEAR A FACEMASK",
                flags: "assets/preventions/mask.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "WASH YOUR HANDS OFTEN",
                flags: "assets/preventions/washhand.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "AVOID CONTACT \nWITH SICK PEOPLE",
                flags: "assets/preventions/nohandshake.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "AVOID TOUCHING SURFACES\n OR CONTAMINATED OBJECTS",
                flags: "assets/preventions/object.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "AVOID ANIMAL CONTACT",
                flags: "assets/preventions/animal.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              SymptomsPanel(
                title: "ALWAYS COVER YOUR\n COUGH OR SNEZZE",
                flags: "assets/preventions/cover.png",
                size: 15.0,
              ), 
              SizedBox(height:10.0),
              
            ],
          ),
        ),
    );
  }
}