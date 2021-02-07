import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animals_app/detail_screen.dart';
import 'dummy.dart';


class  HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mammals"),
        ),
        body:
        ListView(children: animalsList.map((place) {
          return FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(animals: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Image.asset(place.photo)),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            place.name,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(place.type)

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList()
        ));
  }
}
