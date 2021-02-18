import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var pontuacaoFinal = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Verde', 'pontuacao': 7},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Leão', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 4},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'texto': 'Leo', 'pontuacao': 10},
        {'texto': 'Maria', 'pontuacao': 4},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Marielle', 'pontuacao': 8},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoFinal = 0;
    });
  }

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoFinal = pontuacaoFinal + pontuacao;
      });
      print(pontuacaoFinal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    onAnswer: responder,
                    perguntaSelecionada: perguntaSelecionada,
                    perguntas: perguntas,
                  )
                : Resultado(pontuacaoFinal, reiniciarQuestionario)));
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
