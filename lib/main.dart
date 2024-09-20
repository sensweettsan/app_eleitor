import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/Image.dart';

void main() {
  runApp(const EleitorApp());
}

class EleitorApp extends StatelessWidget {
  const EleitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Eleitorpage(),
    );
  }
}

class Eleitorpage extends StatefulWidget {
  const Eleitorpage({super.key});

  @override
  State<Eleitorpage> createState() => _EleitorpageState();
}

class _EleitorpageState extends State<Eleitorpage> {
  TextEditingController idadeController = TextEditingController();
  String resultado = '';
  int idade = 0;

  verificaClasseEleitoral() {
    idade = int.parse(idadeController.text);
    if (idade < 16) {
      resultado = 'NÃO ELEITOR';
    } else if (idade >= 18 && idade <= 65) {
      // "&&" Igual a 'AND' no Python
      resultado = 'ELEITOR OBRIGATÓRIO';
    } else {
      resultado = 'ELEITOR FACULTATIVO';
    }
    setState(() {
      resultado;
      idade;
      idadeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundo Eleitoral'),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Color.fromARGB(249, 255, 251, 18),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 288,
                child: TextField(
                  controller: idadeController,
                  decoration: const InputDecoration(
                    labelText: 'Informe a idade:',
                    prefix: Icon(Icons.account_circle),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly //Permite apenas números
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: verificaClasseEleitoral,
                child: Text('Verificar'),
              ),
              SizedBox(height: 32),
              Text(idade == 0 ? '' : 'Idade: $idade',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 16),
              Text(
                resultado == '' ? '' : 'Classe eleitoral:$resultado',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
