import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('To do list'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Main Screen', style: TextStyle(color: Colors.white, fontSize: 50),),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/todo');
            }, child: const Text('Next'))
          ]
        )
      ) 
    );
  }
}