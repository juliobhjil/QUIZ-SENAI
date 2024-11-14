import 'package:flutter/material.dart';
import 'package:quiz/quizpage.dart';


class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Quiz Senai'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://media1.tenor.com/m/Ynxb0920x0UAAAAd/brain-run.gif', 
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'Quizzando!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage())
                );
              },
              child: const Text('Começar'),
            ),
          ],
        ),
      ),
    );
  }
}