import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'КубГАУ',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'КубГАУ/ Общежития'),
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
  int _counter = 24;
  static const IconData empty_heart = CupertinoIcons.heart;
  static const IconData red_heart = CupertinoIcons.heart;
  void like() {setState((){if (_counter < 25) {_counter++;}});}

  @override
  Widget build(BuildContext context) {
    //AssetImage imageFromAssetImage = AssetImage(assetNamePath);
    //Image: new ExactAssetImage('assets/images/tital.jpg'),
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/tital.png'),

            Container(padding: const EdgeInsets.fromLTRB(0,0,20,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: 360,
                    child: ListTile(
                      title: Text('Общежитие 13', style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('г. Краснодар, ул. Калинина, 13'),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton (
                        icon: Icon(_counter == 25? empty_heart: red_heart),
                        color: _counter == 24? null: Colors.red,
                        onPressed: ()
                        {
                          like();
                        },
                      ),
                      Text('$_counter'),
                    ],

                  )
                ],
              ),
            ),
            Container(padding: const EdgeInsets.fromLTRB(0,0,0,0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children:[
                      Column(
                        children: const [
                          Icon(Icons.phone_android, size: 35,color: Colors.LightGreen),
                          Text('Позвонить', style: TextStyle(color: Colors.LightGreen, fontSize: 16))
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.near_me, size: 35,color: Colors.LightGreen),
                          Text('Маршрут', style: TextStyle(color: Colors.LightGreen, fontSize: 16))
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.share, size: 35,color: Colors.LightGreen),
                          Text('Поделиться', style: TextStyle(color: Colors.LightGreen, fontSize: 16))
                        ],
                      ),
                    ]

                )
            ),
            //const Divider(),

            Container(padding: const EdgeInsets.fromLTRB(10,0,0,0),
                child: const Text(
                    'Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
                    style: TextStyle(fontSize: 18))
            )

          ],

        ),
      ),
    );
  }
}