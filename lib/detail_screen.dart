import 'package:flutter/material.dart';
import 'package:animals_app/animals.dart';
import 'button_favorite.dart';


class DetailScreen extends StatelessWidget {
  final Animals animals;

  const DetailScreen({@required this.animals});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            Stack(
              children: <Widget>[
                Image.asset(animals.photo),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      FavoriteButton()
                    ],
                  ),
                )

              ],
            ),
            Container(
              height: 160.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: animals.imgurl.map((url){
                    return Padding(
                      padding: EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius : BorderRadius.circular(10.0),
                        child: Image.network(url),
                      ),
                    );
                  }).toList()
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(
                animals.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(Icons.insert_emoticon),
                      SizedBox(height: 8.0),
                      Text(animals.type)
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                animals.description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
            ),

          ],
        ),
      ),
    );
  }
}