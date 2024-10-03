
import 'package:flutter/material.dart';

import '../screens/calc_screen.dart';
import '../screens/calculator_screen.dart';
import '../screens/home_screen.dart';
import '../screens/sobre_screen.dart';

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Calculadora'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Calculadora de Consumo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalcScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Sobre'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SobreScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
