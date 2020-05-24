import 'package:covid19info/pages/faq.dart';
import 'package:covid19info/pages/prevention.dart';
import 'package:covid19info/pages/symptom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Infopanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Symptom()));
              },
              child: Container(
                height: 45,
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "   Symptoms",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 1.4, 
                        )
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 30.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height:10.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  PreventionPage()));
              },
              child: Container(
                height: 45,
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "   Preventions",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 1.4, 
                        ),
                      ),
                      
                    ),
                    Icon(Icons.chevron_right, size: 30.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height:10.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FAQpage()));
              },
              child: Container(
                height: 45,
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "   FAQ's",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 1.4, 
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 30.0,),
                  ],
                ),
              ),
            ),
            SizedBox(height:10.0),
            GestureDetector(
              onTap: (){
                launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019');
              },
              child: Container(
                height: 45,
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "   Go to WHO",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 1.4, 
                        ),
                      ),
                      
                    ),
                    Icon(Icons.chevron_right, size: 30,),
                  ],
                ),
                
              ),
            ),
            SizedBox(height:10.0),
          ],
        ),
      ),
    );
  }
}