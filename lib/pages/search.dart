import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
//import 'package:tgd_covid_tracker/datasorce.dart';

import '../datasource.dart';


class Search extends SearchDelegate{
  final List countryList;
  Search(this.countryList);

    @override
    ThemeData appBarTheme(BuildContext context) {
      return ThemeData(
        primaryColor: primaryBlack,
        brightness: DynamicTheme.of(context).brightness
      );
    }


  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = " ";
        },)
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final suggestionList
    =
      query.isEmpty?
      countryList:
      countryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
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
                    Image.network(suggestionList[index]["countryInfo"]["flag"], height:55,),
                    Text(suggestionList[index]['country'].toString(),style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Container( 
                child: Expanded(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("CASES:     " + suggestionList[index]['cases'].toString(),style: TextStyle(color: Colors.blue[700],fontSize: 15,fontWeight: FontWeight.bold),),
                      Divider(height: 2,),
                      Text("ACTIVE:     " + suggestionList[index]['active'].toString(),style: TextStyle(color: Colors.orange[700],fontSize: 15,fontWeight: FontWeight.bold),),
                      Divider(height: 2,),
                      Text("RECOVERED:     " +suggestionList[index]['recovered'].toString(),style: TextStyle(color: Colors.green[700],fontSize: 15,fontWeight: FontWeight.bold),),
                      Divider(height: 2,),
                      Text("DEATHS:     " +suggestionList[index]['deaths'].toString(),style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.bold),),
                    ]
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: const Color(0xE2E2E2),
            border: Border.all(color: const Color(0xC6C6C6)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x29000000),
                // offset: Offset(12, 12),
                blurRadius: 12,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
      itemCount: suggestionList == null ? 0 : suggestionList.length,
    );
  }
}