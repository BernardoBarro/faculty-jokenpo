import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imageApp = const AssetImage("images/padrao.png");

  var _mensagem = "Escolha uma opção:";

  void _opcaoSelecionada(String escolha) {
    var numeroSorteado = Random().nextInt(3);

    setState(() {
      if (numeroSorteado == 1) {
        _imageApp = const AssetImage("images/pedra.png");
        if (escolha == "pedra") {
          _mensagem = "Empatamos!";
        } else if (escolha == "papel") {
          _mensagem = "Você ganhou!";
        } else {
          _mensagem = "Você perdeu :P";
        }
      } else if (numeroSorteado == 2) {
        _imageApp = const AssetImage("images/papel.png");
        if (escolha == "pedra") {
          _mensagem = "Você perdeu :P";
        } else if (escolha == "papel") {
          _mensagem = "Empatamos!";
        } else {
          _mensagem = "Você ganhou!";
        }
      } else {
        _imageApp = const AssetImage("images/tesoura.png");
        if (escolha == "pedra") {
          _mensagem = "Você ganhou!";
        } else if (escolha == "papel") {
          _mensagem = "Você perdeu :P";
        } else {
          _mensagem = "Empatamos!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("JokenPô"),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Escolha do App"),
            ),
            Image(
              image: _imageApp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(_mensagem),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset(
                    "images/pedra.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
