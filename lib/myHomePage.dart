import 'package:flutter/material.dart';
import 'package:slam3_tp1/login.dart';
import 'dart:math';
import 'debox.dart';
import 'package:dice_icons/dice_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int currentPageIndex = 0;
  int _nbRandom1 = 1;
  int _nbRandom2 = 1;
  int _reponse = 0;
  bool _generationList = false;
  String _valueDropDown = '1';
  final List<String> _liste = <String>[];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _desincrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 1;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Text('Gestion des utilisateurs'),
            ),
            ListTile(
              title: const Text('Inscription'),
              leading: const Icon(Icons.edit),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            ListTile(
              title: const Text('Changement de mot de passe'),
              leading: const Icon(Icons.password),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: <Widget>[
        //Page "Accueil"
        ListView(
          children: [
            Image.network(
              'https://assets-global.website-files.com/5f3c19f18169b62a0d0bf387/60d33be8cf4ba7565123c8bc_YPD3ulQQAGQpOcnqIm3QzSTRgzmr1SexpW9ZjMpJ1mAnUxx4iF05XOTu44sk0qQG-8XgBcYmGZGAD-5SAZvJl3TjtmhgWnn-w0C2XKwhBscV78RVvhwZfyp0v_Pa6sNj5zxpOvRW.png',
              fit: BoxFit.scaleDown,
              width: 100,
            ),
            const Text(
              'Nombre :',
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'images/images.jpg',
              width: 100,
              //height: 150,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
        // Page "page suivante"
        Container(
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
                items:
                    creerliste().map<DropdownMenuItem<String>>((String value) {
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
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
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
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  )),
            ],
          ),
        ),
        // Page "Parametre"
        Container(
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
            )),
      ][currentPageIndex],
      // Boutton Incrémentation
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                onPressed: _desincrementCounter,
                child: const Icon(Icons.remove),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: _resetCounter,
                child: const Icon(Icons.refresh),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      // Menu
    );
  }
}
