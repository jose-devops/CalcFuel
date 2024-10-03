import 'package:flutter/material.dart';

import '../components/drawer_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),

      ),
      drawer: DrawerCustom(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [


          Container(
            padding: EdgeInsets.all(26.0),
            width: 500,
            height: 600,
            color: Colors.teal,

            child: Column(
              children: [
                Row(
                  children: [
                    Text('Bem vindo!')
                  ],
                ),

                Container(
                  child: Column(
                    children: [
                      Image.asset(''),

                    ],
                  ),

                )

              ],
            ),

          ),

        ],


      ),

    );
  }
}
