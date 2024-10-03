import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Consumo'),

      ),
      drawer: DrawerCustom(),
      body: Column(

      ),
    );
  }
}
