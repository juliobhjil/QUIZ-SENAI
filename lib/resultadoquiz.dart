import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int score;
  final Function resultadoquiz;

  const Result({super.key, required this.score, required this.resultadoquiz});

  @override
  Widget build(BuildContext context) {
    
    String mensagem;
    String gifUrl;

    if (score > 5) {
      mensagem = "Parabéns, você teve um bom desempenho!";
      gifUrl = 'https://media.tenor.com/ZisvzS5S1HkAAAAM/the-rock-surprised.gif'; 
    } else {
      mensagem = "Você terá um bom desempenho na próxima!";
      gifUrl = 'https://media.tenor.com/aGgnqxZUzeUAAAAM/sad.gif'; 
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
            // Exibe o GIF
            Image.network(
              gifUrl,
              height: 200,
              fit: BoxFit.cover,
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
