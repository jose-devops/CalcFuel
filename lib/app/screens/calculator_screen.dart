import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = ''; // Mostra a conta sendo digitada
  String _displayTotal = ''; // Mostra o resultado da conta
  String _operador = '';
  double? _num1;
  double? _num2;

  // Adiciona números e operadores ao display
  void _addToDisplay(String value) {
    setState(() {
      _display += value;
    });
  }

  // Apagar tudo
  void _clearAll() {
    setState(() {
      _display = '';
      _displayTotal = '';
      _num1 = null;
      _num2 = null;
      _operador = '';
    });
  }

  // Apagar o último caractere
  void _clear() {
    setState(() {
      if (_display.isNotEmpty) {
        _display = _display.substring(0, _display.length - 1);
      }
    });
  }

  // Adiciona operador ao display e define o primeiro número
  void _addOperator(String operator) {
    if (_display.isNotEmpty) {
      setState(() {
        _num1 = double.tryParse(_display);
        _display += operator;
        _operador = operator;
      });
    }
  }

  // Função para somar
  void _somar() {
    _addOperator('+');
  }

  // Função para multiplicar
  void _multiplicar() {
    _addOperator('x');
  }

  // Função para dividir
  void _dividir() {
    _addOperator('/');
  }

  // Função para subtrair
  void _subtrair() {
    _addOperator('-');
  }

  // Inverter o sinal do número
  void _negativar() {
    setState(() {
      if (_display.isNotEmpty && _display != '0') {
        if (_display.startsWith('-')) {
          _display = _display.substring(1);
        } else {
          _display = '-' + _display;
        }
      }
    });
  }

  // Realiza o cálculo da expressão
  void _calcular_total() {
    if (_operador.isNotEmpty && _display.contains(_operador)) {
      final partes = _display.split(_operador);
      _num2 = double.tryParse(partes[1]);

      if (_num2 != null) {
        double total = 0;
        if (_operador == '+') {
          total = _num1! + _num2!;
        } else if (_operador == '-') {
          total = _num1! - _num2!;
        } else if (_operador == 'x') {
          total = _num1! * _num2!;
        } else if (_operador == '/') {
          if (_num2 != 0) {
            total = _num1! / _num2!;
          } else {
            _displayTotal = 'Erro'; // Não pode dividir por zero
            return;
          }
        }
        setState(() {
          _displayTotal = total.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      drawer: DrawerCustom(),
      body: Column(
        children: [
          // Display
          Container(
            height: 406,
            color: Colors.brown,
            child: Column(
              children: [
                // Conta
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(20.0),
                  height: 203,
                  color: Colors.teal,
                  child: Text(
                    _display.isEmpty ? '' : _display,
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
                // Total
                Container(
                  height: 203,
                  color: Colors.greenAccent,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    _displayTotal.isEmpty ? '' : _displayTotal,
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          // Botões
          Container(
            height: 500,
            color: Colors.black12,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                // Primeira linha de botões

                // Segunda linha de botões
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('7'),
                          child: Text(
                            '7',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('8'),
                          child: Text(
                            '8',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('9'),
                          child: Text(
                            '9',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _multiplicar,
                          child: Text(
                            'x',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Terceira linha de botões
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('4'),
                          child: Text(
                            '4',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('5'),
                          child: Text(
                            '5',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('6'),
                          child: Text(
                            '6',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _subtrair,
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Quarta linha de botões
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('1'),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('2'),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('3'),
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _somar,
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Quinta linha de botões
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _clearAll,
                          child: Text(
                            'C',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('0'),
                          child: Text(
                            '0',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(

                        child: ElevatedButton(
                          onPressed: _calcular_total,
                          child: Text(
                            '=',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _dividir,
                          child: Text(
                            '/',
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
