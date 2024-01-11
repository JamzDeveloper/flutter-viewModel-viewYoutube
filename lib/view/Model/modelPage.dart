import 'package:flutter/material.dart';
import 'package:prueba/class/model.class.dart';
import 'package:prueba/components/flutter-view.dart';
import 'package:prueba/components/flutter-yoututbe.dart';

class ModelPage extends StatelessWidget {
  final Model model;
  const ModelPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 34, 56),
      appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.white),
        title: Center(child: Text(model.title, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold //
                ),)),
           backgroundColor: Color.fromARGB(255, 38, 34, 56),
      ),
      body: Column(
        children: [
          Container(height: 300, child: ViewModel(urlModel: model.modeUrl)),
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                model.description,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white, //
                ),
              )),
            Container(
              child: YoutubeComponent(url: model.urlVideo),
            )
        ],
      ),
    );
  }
}
