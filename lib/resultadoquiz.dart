import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resultadoquiz;

  const Result({super.key, required this.score, required this.resultadoquiz});

  @override
  Widget build(BuildContext context) {
    String mensagem;
    if (score > 5) {
      mensagem = "Parabéns, você teve um bom desempenho!";
    } else {
      mensagem = "Você terá um bom desempenho na próxima!";
    }

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
              'https://media1.tenor.com/m/Ynxb0920x0UAAAAd/brain-run.gif', 
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Pontuação: $score/10',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
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
