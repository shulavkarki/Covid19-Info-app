//import 'package:covid19info/homepage.dart';
import 'package:covid19info/panels/editCountry.dart';
// import 'package:covid19info/panels/country.dart';
//import 'package:covid19info/panels/editCountry.dart';
//import 'package:covid19info/panels/editCountry.dart';
import 'package:flutter/material.dart';




class Choosecountry extends StatefulWidget {

  final List countryData;
  

  const Choosecountry({Key key, this.countryData,}) : super(key: key); 
  @override
  _ChoosecountryState createState() => _ChoosecountryState();
}

class _ChoosecountryState extends State<Choosecountry> {


  void update(index) {
   
    Navigator.pop(context, MaterialPageRoute(builder: (context)=> EditCountry(index:index)));

  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:3.0, horizontal: 6.0),
            child: Card(
              //color: Colors.blueGrey[300],
              child: ListTile(
                onTap:(){
                  update(index);
                },
                title: Text(
                  widget.countryData[index]["country"]
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.countryData[index]["countryInfo"]['flag']),
                ),

              ),
            ),
          );
        },
        itemCount: widget.countryData == null ? 0 : widget.countryData.length,
      ),
    );
  }
}