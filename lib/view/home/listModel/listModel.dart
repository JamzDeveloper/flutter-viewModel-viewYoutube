import 'package:flutter/material.dart';
import 'package:prueba/db/db.dart';
import 'package:prueba/view/Model/modelPage.dart';

class ListModel extends StatefulWidget {
  const ListModel({super.key});

  @override
  State<ListModel> createState() => _ListModelState();
}

class _ListModelState extends State<ListModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            // return

            final model = models[index];
            print(context);
            return Card(
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
                title: Text(model.title),
                subtitle: Text(model.category),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ModelPage(model: model,)));
                },
              ),
            );
          }),
    );
  }
}
