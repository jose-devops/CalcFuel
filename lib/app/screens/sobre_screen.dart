import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';


class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),

      ),
      drawer: DrawerCustom(),
      body: Column(

      ),
    );
  }
}
