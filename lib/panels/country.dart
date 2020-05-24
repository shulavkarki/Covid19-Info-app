import 'package:flutter/material.dart';

import 'package:covid19info/pages/search.dart';

class ListCountry extends StatefulWidget {
  final List countryData;

  const ListCountry({Key key, this.countryData}) : super(key: key);

  @override
  _ListCountryState createState() => _ListCountryState();
}

class _ListCountryState extends State<ListCountry> {
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:Text("Country Stats"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.countryData));
            },
          ),
        
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return  Container(
            margin: EdgeInsets.symmetric(vertical:10,horizontal:15),
            width: width,
            height: 155.0,
            child: Row(
              
              children: <Widget>[

                Container(
                  margin: EdgeInsets.fromLTRB(20,20,50,20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(widget.countryData[index]["countryInfo"]["flag"], height:55,),
                      Text(widget.countryData[index]['country'].toString(),style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container( 
                  child: Expanded(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("CASES:     " + widget.countryData[index]['cases'].toString(),style: TextStyle(color: Colors.blue[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("ACTIVE:     " + widget.countryData[index]['active'].toString(),style: TextStyle(color: Colors.orange[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("RECOVERED:     " + widget.countryData[index]['recovered'].toString(),style: TextStyle(color: Colors.green[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("DEATHS:     " + widget.countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.bold),),
                      ]
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xE2E2E2),
              border: Border.all(
                width: 0.3, 
                color: const Color(0xC6C6C6)
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  //offset: Offset(12, 12),
                  blurRadius: 12,
                ),
                
              ],
              borderRadius: BorderRadius.circular(12),
            ),
          );
        },
        itemCount: widget.countryData == null ? 0 : widget.countryData.length,
      ),
    );

    
  }
}