import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _litrosController = TextEditingController();

  List<Map<String, dynamic>> _consumoList = [];

  void _calcularConsumo() {
    final double km = double.tryParse(_kmController.text) ?? 0;
    final double litros = double.tryParse(_litrosController.text) ?? 0;

    if (km > 0 && litros > 0) {
      final double media = km / litros;
      setState(() {
        _consumoList.add({
          'km': km,
          'litros': litros,
          'media': media.toStringAsFixed(2),
        });
        _kmController.clear();
        _litrosController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Insira valores válidos para Km e Litros.'),
      ));
    }
  }

  void _removerItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Você tem certeza que deseja remover este item?'),
          actions: [
            TextButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                setState(() {
                  _consumoList.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Consumo'),
      ),
      drawer: DrawerCustom(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Container(
              child: Column(
                children: [
                  Image.asset('assets/images/bombaGasolina.png'),

                ],
              ),

            ),
            TextField(
              controller: _kmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Km Rodados',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _litrosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Litros de Combustível',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularConsumo,
              child: Text('Calcular e Adicionar'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _consumoList.length,
                itemBuilder: (context, index) {
                  final item = _consumoList[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Km Rodados: ${item['km']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Litros: ${item['litros']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Média: ${item['media']} km/l',
                            style: TextStyle(fontSize: 16),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removerItem(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
