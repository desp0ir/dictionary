import 'package:flutter/material.dart';
import 'package:sozluk/sozluk.dart';
import 'package:sozluk/sozlukdao.dart';

class Sonraki extends StatefulWidget {

  final int id;
  
  const Sonraki({super.key, required this.id});

  @override
  State<Sonraki> createState() => _SonrakiState();
}

class _SonrakiState extends State<Sonraki> {
bool isLoading = true;
List<sozluk> satir = [];  
 
 
  @override
  void initState() {
    super.initState();
  kelimeleriAl();
  }

   Future<void> kelimeleriAl() async{
   satir = await Sozlukdao().getir();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("kelime"),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : (widget.id < satir.length) 
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Kelime: ${satir[widget.id - 1].kelime}", style: TextStyle(fontSize: 24)),
                      Text("Anlamı: ${satir[widget.id - 1].anlami}", style: TextStyle(fontSize: 20)),
                    ],
                  )
                : Text("Hata: Geçersiz Kelime ID", style: TextStyle(fontSize: 20, color: Colors.red)),
      ),
    );
  }
}