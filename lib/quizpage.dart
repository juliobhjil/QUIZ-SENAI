import 'package:flutter/material.dart';
import 'package:quiz/resultadoquiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'Qual é o atual presidente do Brasil?',
      'image':'assets/Q1.gif',
      'answers': [
        {'text': 'Lula', 'isCorrect': true},
        {'text': 'Bolsonaro', 'isCorrect': false},
        {'text': 'JK', 'isCorrect': false},
      ],
    },
    {
      'question': 'Qual desses animais é mamífero?',
      'image':'assets/Q2.gif',
      'answers': [
        {'text': 'Tigre', 'isCorrect': false},
        {'text': 'Leão', 'isCorrect': false},
        {'text': 'Cachorro', 'isCorrect': true},
      ],
    },
    {
      'question': 'Quanto é 1+1?',
      'image':'assets/Q3.gif',
      'answers': [
        {'text': '3', 'isCorrect': false},
        {'text': '2', 'isCorrect': true},
        {'text': '6', 'isCorrect': false},
      ],
    },
    {
      'question': 'O Batman é?',
      'image':'assets/Q4.gif',
      'answers': [
        {'text': 'Vilão', 'isCorrect': false},
        {'text': 'Ant-Herói', 'isCorrect': false},
        {'text': 'Herói', 'isCorrect': true},
      ],
    },
    {
      'question': 'O Sol é?',
      'image':'assets/q5.gif',
      'answers': [
        {'text': 'Planeta', 'isCorrect': false},
        {'text': 'Estrela', 'isCorrect': true},
        {'text': 'Meteoro', 'isCorrect': false},
      ],
    },
    {
      'question': 'Miami fica localizada em:',
      'image':'assets/Q6.gif',
      'answers': [
        {'text': 'Chile', 'isCorrect': false},
        {'text': 'Estados Unidos', 'isCorrect': true},
        {'text': 'Brasil', 'isCorrect': false},
      ],
    },
    {
      'question': 'Quantos títulos o Brasil tem?',
      'image':'assets/Q7.gif',
      'answers': [
        {'text': '7', 'isCorrect': false},
        {'text': '5', 'isCorrect': true},
        {'text': '4', 'isCorrect': false},
      ],
    },
    {
      'question': 'Macacos me...?',
      'image':'assets/Q00.gif',
      'answers': [
        {'text': 'peguem!', 'isCorrect': false},
        {'text': 'mordam!', 'isCorrect': true},
        {'text': 'ajudem!', 'isCorrect': false},
      ],
    },

    {
      'question': 'Quem descobril o Brasil?',
      'image':'assets/Q8.gif',
      'answers': [
        {'text': 'Indigenas', 'isCorrect': true},
        {'text': 'Pedro Alvares Cabral', 'isCorrect': false},
        {'text': 'Getulio Vargas', 'isCorrect': false},
      ],
    },

    {
      'question': 'Phyton é:',
      'image':'assets/Q9.gif',
      'answers': [
        {'text': 'Cobra', 'isCorrect': false},
        {'text': 'Linguagem de Programação', 'isCorrect': true},
        {'text': 'Banco de dados', 'isCorrect': false},
      ],
    },
  ];
int questionIndex = 0;
int numeropergunta = 1;
  int score = 0;

  void answerQuestion(bool isCorrect) {
    setState(() {
      if (isCorrect) {
        score++;
      }
      //quiz;
      proximaQuestao(isCorrect);
    });
  }

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
    
  }

  void proximaQuestao(bool isCorrect) {
    setState(() {
      if (questionIndex < questions.length -1 ) {
        questionIndex++;
        numeropergunta++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Result(score:score, resultadoquiz:restartQuiz ),
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.blueAccent,
      ),
        body : 
        Column(
          children:<Widget>[
          Text('Questão $questionIndex'),
            Expanded(child: Image.asset(questions[questionIndex]['image']as String),),
             questionIndex < questions.length 
            ? Quiz(
                question: questions[questionIndex]['question'] as String,
                answers: questions[questionIndex]['answers'] as List<Map<String, Object>>,
                answerQuestion: answerQuestion,
              )
            : Result(score: score, resultadoquiz: restartQuiz),
            ]
        ),
    );
  }
}



class Quiz extends StatelessWidget {
  final String question;
  final List<Map<String, Object>> answers;
  final Function(bool) answerQuestion;

  const Quiz({
    super.key,
    required this.question,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              question,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ...answers.map((answer) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => answerQuestion(answer['isCorrect'] as bool),
                child: Text(answer['text'] as String),
                
              ),
              );
          }),
        ],
      ),
    );
  }
}
