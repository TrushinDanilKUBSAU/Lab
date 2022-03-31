import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'калькулятор площади'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sd1 = 0;
  int sd2 = 0;
  Text txt = Text("");

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("сторона 1:"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: TextFormField(validator: (value) {
                      if (value!.isEmpty || int.tryParse(value) == null)
                        return 'ошибка ввода данных';
                      else {
                        sd1 = int.parse(value);
                        return null;
                      }
                    },//это под высоту, ширина такая же
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("сторона 2:"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: TextFormField(validator: (value) {
                      if (value!.isEmpty || int.tryParse(value) == null)
                        return 'ошибка ввода данных';
                      else {
                        sd2 = int.parse(value);
                        return null;
                      }
                    },
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    int S = sd1 * sd2;

                    if (S >= 0 && sd1 >= 0 && sd2 >= 0) {
                      txt = Text("S = $sd1*$sd2 = $S",
                          style: const TextStyle(color: Colors.lightGreen, fontSize: 40));
                    }
                    else {
                      txt = const Text("ошибка",
                          style: TextStyle(color: Colors.redAccent, fontSize: 40));
                    }

                  });
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: const Text(
                "Вычислить",
              ),
            ),
            txt,
          ],
        ),
      ),
    );
  }
}

