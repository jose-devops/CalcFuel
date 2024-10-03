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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Este aplicativo foi desenvolvido por José Roberto da Silva, seguindo todas as orientações repassadas em sala de aula pelo professor Vagnar, durante o curso na Faculdade UniSenai Chapecó.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'O projeto reflete os conhecimentos adquiridos ao longo das aulas e tem como objetivo aplicar as técnicas aprendidas no desenvolvimento de aplicações móveis utilizando o Flutter.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
