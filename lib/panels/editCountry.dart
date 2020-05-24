import 'package:flutter/material.dart';

class EditCountry extends StatelessWidget {
  final List editCountry;
  final int index;

  const EditCountry({Key key, this.editCountry, this.index}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical:20,horizontal:13),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left:20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.network(editCountry[index]["countryInfo"]["flag"], height:80,),
                Text(editCountry[index]['country'].toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                
              ], 
            ),
          ),
          
          SizedBox(width:100,),

         Container( 
            child: Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("CASES:     " + editCountry[index]['cases'].toString(),style: TextStyle(color: Colors.blue[700],fontSize: 15,fontWeight: FontWeight.bold),),
                  Divider(height: 2,),
                  Text("ACTIVE:     " + editCountry[index]['active'].toString(),style: TextStyle(color: Colors.orange[700],fontSize: 15,fontWeight: FontWeight.bold),),
                  Divider(height: 2,),
                  Text("RECOVERED:     " + editCountry[index]['recovered'].toString(),style: TextStyle(color: Colors.green[700],fontSize: 15,fontWeight: FontWeight.bold),),
                  Divider(height: 2,),
                  Text("DEATHS:     " + editCountry[index]['deaths'].toString(),style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.bold),),
                ]
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: const Color(0xE2E2E2),
        border: Border.all(
          width: 2,
          color: const Color(0xC6C6C6)
        ),
        boxShadow: [
          BoxShadow(

            color: const Color(0x29000000),
            offset: Offset(7, 7),
            blurRadius: 30,
          ),
          
        ],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

