import 'package:flutter/material.dart';

class DeBox extends StatelessWidget {
  DeBox({Key? key, this.faceDe, this.description, this.valeur, this.image})
      : super(key: key);
  final String? faceDe;
  final String? description;
  final int? valeur;
  final String? image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("images/" + image!),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.faceDe!,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description!),
                          Text("Valeur: " + this.valeur.toString()),
                        ],
                      )))
            ])));
  }
}
