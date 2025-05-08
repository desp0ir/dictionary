import 'package:flutter/material.dart';
import 'package:sozluk/sonraki.dart';
import 'package:sozluk/sozluk.dart';
import 'package:sozluk/sozlukdao.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sozluk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'SOZLUK'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


List<sozluk> satir = [];  




@override
  void initState() {
    super.initState();
  kelimeleriAl();
  }

   Future<void> kelimeleriAl() async{
   satir = await Sozlukdao().getir();
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:GestureDetector(
        child: ListView.builder(
          itemCount: satir.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Text("${index +1}"),
              title: Text(satir[index].kelime),
              subtitle: Text(satir[index].anlami),
               onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => Sonraki(id: satir[index].kelime_id)));
              },
            );
        }),
      ),
    );
  }
}
