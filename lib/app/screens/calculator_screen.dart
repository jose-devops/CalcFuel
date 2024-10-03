import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '';
  String _displayTotal = '';
  String _operador = '';
  double? _num1;
  double? _num2;


  void _addToDisplay(String value) {
    setState(() {
      _display += value;
    });
  }


  void _clearAll() {
    setState(() {
      _display = '';
      _displayTotal = '';
      _num1 = null;
      _num2 = null;
      _operador = '';
    });
  }


  void _clear() {
    setState(() {
      if (_display.isNotEmpty) {
        _display = _display.substring(0, _display.length - 1);
      }
    });
  }


  void _addOperator(String operator) {
    if (_display.isNotEmpty) {
      setState(() {
        _num1 = double.tryParse(_display);
        _display += operator;
        _operador = operator;
      });
    }
  }


  void _somar() {
    _addOperator('+');
  }


  void _multiplicar() {
    _addOperator('x');
  }


  void _dividir() {
    _addOperator('/');
  }


  void _subtrair() {
    _addOperator('-');
  }


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
            _displayTotal = 'Erro';
            return;
          }
        }
        setState(() {
          _clearAll();
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
            color: Colors.black,
            child: Column(
              children: [
                // Conta
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(20.0),
                  height: 203,

                  child: Text(
                    _display.isEmpty ? '' : _display,
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                // Total
                Container(
                  height: 203,

                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    _displayTotal.isEmpty ? '' : _displayTotal,
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Color(0xFF00FF00)),
                  ),
                ),
              ],
            ),
          ),
          // Botões
          Container(
            height: 500,
            color: Colors.black,
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('7'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '7',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('8'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '8',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('9'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '9',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _multiplicar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            'x',
                            style: TextStyle(fontSize: 40, color: Color(0xFF00FF00)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('4'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '4',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('5'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '5',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('6'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '6',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _subtrair,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 40, color: Color(0xFF00FF00)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('1'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('2'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('3'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _somar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 40, color: Color(0xFF00FF00)),
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
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _clearAll,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            'C',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _addToDisplay('0'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '0',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _clear,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: EdgeInsets.all(18),
                          ),
                          child: Icon(
                            Icons.backspace_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _dividir,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '/',
                            style: TextStyle(fontSize: 40, color: Color(0xFF00FF00)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                // Botão de "="
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: ElevatedButton(
                          onPressed: _calcular_total,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF333333),
                          ),
                          child: Text(
                            '=',
                            style: TextStyle(fontSize: 40, color: Color(0xFF00FF00)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
