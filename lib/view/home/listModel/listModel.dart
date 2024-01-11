import 'package:flutter/material.dart';
import 'package:prueba/class/model.class.dart';
import 'package:prueba/db/db.dart';
import 'package:prueba/view/Model/modelPage.dart';

class ListModel extends StatefulWidget {
  const ListModel({super.key});

  @override
  State<ListModel> createState() => _ListModelState();
}

class _ListModelState extends State<ListModel> {
  List<Model> listItems = models;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 18, 63),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "Busca Tu animal Favorito",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              )),
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 0, left: 15, right: 15),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 57, 44, 114),
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 130, 121, 168),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                hintText: "Ingrese un nombre",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromARGB(255, 112, 58, 211),
                contentPadding: const EdgeInsets.only(top: 8, bottom: 8),
                counterStyle: const TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                if (value == '') {
                  listItems = models;
                } else {
                  listItems = models
                      .where((element) => element.title
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                }
                setState(() {});
              
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (BuildContext context, int index) {
                  // return

                  final model = listItems[index];
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width:
                              1.0, // Ajusta el ancho del borde según tus preferencias
                          color: Color.fromARGB(
                              255, 216, 216, 216), // Define el color del borde
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          image: NetworkImage(
                            model.imagePreview,
                          ),
                        ),
                      ),
                      // leading: CircleAvatar(
                      //     radius: 28,
                      //     backgroundImage: NetworkImage(models[index].imagePreview)),
                      title: Text(
                        model.title,
                        style:const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        model.category,
                        style: const TextStyle(
                            color: Color.fromARGB(141, 255, 255, 255)),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded,
                          color: Colors.orange),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ModelPage(
                                  model: model,
                                )));
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
