import 'dart:convert';

import 'package:covid19info/panels/choose_country.dart';
import 'package:covid19info/panels/country.dart';
import 'package:covid19info/panels/editCountry.dart';
import 'package:covid19info/panels/infopanel.dart';
import 'package:covid19info/panels/mostaffectedcountries.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:covid19info/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';

class Home extends StatefulWidget {

  final int index;

  const Home({Key key, this.index}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 
  Map worldData;
  fetchWorldwideData() async{
    http.Response response = await http.get('https://disease.sh/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchcountryData() async{
    http.Response response = await http.get('https://disease.sh/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  // Map editCountry;
  // fectchSelectedCountry() async {
  //   http.Response response = await http.get('https://disease.sh/v2/countries/nepal');
  //   setState(() {
  //     editCountry = json.decode(response.body);
  //   });
  // }

  Future fetchData() async{
    fetchcountryData();
    
    fetchWorldwideData();
    print('Refreshed the data.');
    
  }




  @override
  void initState() {
    // fectchSelectedCountry();
    fetchData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 TRACKER'),
        backgroundColor: Colors.blueGrey[700],
        actions: <Widget>[
          IconButton(icon: Icon(Theme.of(context).brightness==Brightness.light?Icons.lightbulb_outline:Icons.highlight), onPressed: (){
          DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
          })
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: Container(
          child: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                child: Image.asset('assets/giphy.gif', fit: BoxFit.fill,width: width,),
              ),
              Padding(
                
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'WorldWide',
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5,)
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.grey,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ListCountry(countryData:countryData)));
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
              worldData == null ? Padding(
                padding: const EdgeInsets.all(70.0),
                child: SpinKitWave(color: Colors.green[300], size: 50.0,),
              ) : WorldwidePanel(worldData: worldData,),
           
              
              Container(
                margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 10),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text('Choose your Country.',style: GoogleFonts.pangolin(fontSize: 25,fontWeight:FontWeight.bold,textStyle: TextStyle(letterSpacing: 1.5,),),),
                      SizedBox(width:20.0),
                      IconButton(icon: Icon(Icons.edit,color:Colors.blue), onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Choosecountry(countryData: countryData,)));
                      }),
                    ],),
                    
                    countryData == null ? Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: SpinKitWave(color: Colors.green[300], size: 50.0,),
                    ) : EditCountry(editCountry: countryData,index: 126,),
                  ],
                ),
              ),

              

              

              Padding(
                
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Most Affected Countries',
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.5,)
                      ),
                    ),
                  
                  ],
                ),
              ),
              countryData == null ? Padding(
                padding: const EdgeInsets.all(50.0),
                child: SpinKitWave(color: Colors.green[300], size: 50.0,),
              ) : MostAffectedPanel(countryData: countryData),
              SizedBox(height:15.0),
              Infopanel(),


              SizedBox(height:7.0),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "EVERYTIHNG'S GONNA BE OKAY.",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[500],
                          letterSpacing: 1.3,
                        )
                      ),
                    ),
                    SizedBox(height:7.0),
                    Text(
                      "LET'S FIGHT THIS COVID19 TOGETHER.",
                      style: GoogleFonts.pangolin(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[500],
                          letterSpacing: 1.5
                        )
                      ),
                    ),
                    SizedBox(height:15.0),
                  ],
                ),
              ),
              
            ],
          )),
        ),
      ),
      
    );
  }
}