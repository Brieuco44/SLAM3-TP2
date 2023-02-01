import 'package:flutter/material.dart';
import 'debox.dart';

class listede extends StatelessWidget {
  const listede({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            DeBox(
                faceDe: "1",
                description: "La face 1 du dé",
                valeur: 1,
                image: "face1.png"),
            DeBox(
                faceDe: "2",
                description: "La face 2 du dé",
                valeur: 2,
                image: "face2.png"),
            DeBox(
                faceDe: "3",
                description: "La face 3 du dé",
                valeur: 3,
                image: "face3.png"),
            DeBox(
                faceDe: "4",
                description: "La face 4 du dé",
                valeur: 4,
                image: "face4.png"),
            DeBox(
                faceDe: "5",
                description: "La face 5 du dé",
                valeur: 5,
                image: "face5.png"),
            DeBox(
                faceDe: "5",
                description: "La face 6 du dé",
                valeur: 6,
                image: "face6.png"),
          ],
        ));
  }
}
