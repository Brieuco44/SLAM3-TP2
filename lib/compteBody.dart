import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'navbar.dart';
import 'package:flutter/material.dart';

class compteBody extends StatefulWidget {
  const compteBody({super.key});

  @override
  State<compteBody> createState() => _compteBodyState();
}

class _compteBodyState extends State<compteBody> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
