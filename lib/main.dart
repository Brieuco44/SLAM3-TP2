import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';
import 'debox.dart';
import 'my_flutter_app_icons.dart';
import 'package:dice_icons/dice_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Découverte de Flutter'),
    );
  }
}

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
  List<int> _liste = [];

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

  void _creerliste() {
    int nb = 0;
    for (var i in nb) {
      _liste.add(i);
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          //child: const Text('Page suivante'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          NavigationDestination(
            selectedIcon: Text("="),
            icon: Icon(Icons.start),
            label: 'Page suivante',
          ),
          NavigationDestination(
            selectedIcon: Icon(DiceIcons.dice1),
            icon: Icon(DiceIcons.dice6),
            label: 'parametres',
          ),
        ],
      ),
    );
  }
}
