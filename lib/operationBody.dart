import 'package:flutter/material.dart';
import 'package:slam3_tp1/login.dart';
import 'dart:math';
import 'debox.dart';
import 'package:dice_icons/dice_icons.dart';

class operationBody extends StatefulWidget {
  const operationBody({super.key});

  @override
  State<operationBody> createState() => _operationBodyState();
}

class _operationBodyState extends State<operationBody> {
  int _counter = 1;
  int currentPageIndex = 0;
  int _nbRandom1 = 1;
  int _nbRandom2 = 1;
  int _reponse = 0;
  bool _generationList = false;
  String _valueDropDown = '1';
  final List<String> _liste = <String>[];

  void _nbAleatoire() {
    setState(() {
      if (_counter != 0) {
        _nbRandom1 = Random().nextInt(_counter + 1);
        _nbRandom2 = Random().nextInt(_counter + 1);
      } else {
        _nbRandom1 = 1;
        _nbRandom2 = 1;
      }
    });
  }

  void _verification() {
    if (_reponse == _nbRandom1 + _nbRandom2) {
      _showToast(context, "Bonne réponse");
    } else {
      _showToast(context, "Mauvaise réponse");
    }
  }

  void _showToast(BuildContext context, String _message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(_message),
      ),
    );
  }

  List<String> creerliste() {
    if (!_generationList) {
      for (var i = 1; i <= 20; i++) {
        setState(() {
          _liste.add(i.toString());
        });
      }
      _generationList = true;
    }
    return _liste;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            icon: const Icon(DiceIcons.dice5),
            iconSize: 30,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.yellow,
            ),
            value: _valueDropDown.toString(),
            items: creerliste().map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (valeur) {
              setState(() {
                _valueDropDown = valeur!;
              });
            },
          ),
          Text(
            '$_nbRandom1 + $_nbRandom2',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: _nbAleatoire,
              child: Text('Générer un calcul'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey),
              )),
          TextField(
            onChanged: (value) {
              _reponse = int.parse(value);
            },
            keyboardType: TextInputType.number,
            maxLength: 3,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: const InputDecoration(
                labelText: 'Entrer la solution',
                hintText: 'Entrer un nombre',
                border: OutlineInputBorder()),
          ),
          ElevatedButton(
              onPressed: _verification,
              child: Text('Valider'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey),
              )),
        ],
      ),
    );
  }
}
