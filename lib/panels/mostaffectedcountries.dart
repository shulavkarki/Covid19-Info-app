import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class MostAffectedPanel extends StatelessWidget {

  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(
          itemCount: 5,
          
          itemBuilder: (BuildContext context, int index) =>
          Container(
            //color: Colors.grey,
            margin: EdgeInsets.only(top: 20),
            width: width,
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(countryData[index]["countryInfo"]["flag"], height:75,),
                      Text(countryData[index]['country'].toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container( 
                  child: Expanded(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("CASES:     " + countryData[index]['cases'].toString(),style: TextStyle(color: Colors.blue[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("ACTIVE:     " + countryData[index]['active'].toString(),style: TextStyle(color: Colors.orange[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("RECOVERED:     " + countryData[index]['recovered'].toString(),style: TextStyle(color: Colors.green[700],fontSize: 15,fontWeight: FontWeight.bold),),
                        Divider(height: 2,),
                        Text("DEATHS:     " + countryData[index]['deaths'].toString(),style: TextStyle(color: Colors.red[700],fontSize: 15,fontWeight: FontWeight.bold),),
                      ]
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0xE2E2E2),
              border: Border.all(
                //width: 0.5, 
                color: const Color(0xC6C6C6)
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  //offset: Offset(12, 12),
                  blurRadius: 24,
                ),
                
              ],
              borderRadius: BorderRadius.circular(12),
            ),
          ), 
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        );
    
  }
}
