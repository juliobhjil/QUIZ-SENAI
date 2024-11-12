import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resultadoquiz;
  

  const Result({super.key, required this.score, required this.resultadoquiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://static6.depositphotos.com/1000658/597/v/450/depositphotos_5970020-stock-illustration-illustration-human-brain-in-profile.jpg', 
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Pontuação: $score/10',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                resultadoquiz(); 
                Navigator.pop(context); 
              },
              child: const Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}