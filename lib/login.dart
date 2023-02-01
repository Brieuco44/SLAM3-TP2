import 'package:flutter/material.dart';
import 'navbar.dart';

class Login extends StatelessWidget {
  Login({Key? formKey}) : super(key: formKey);
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String pwd = "";

  void _verifier(context) {
    if (email == "test" && pwd == "test") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Navbar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre adresse email';
                  } else {
                    email = value;
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de Passe',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  } else {
                    pwd = value;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _verifier(context);
                  }
                },
                child: const Text('Connexion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
