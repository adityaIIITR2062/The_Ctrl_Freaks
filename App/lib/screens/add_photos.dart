import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management/firebase_storage_services/storage_services.dart';

class Addphotos extends StatefulWidget{
  @override
  State<Addphotos> createState() => _AddphotosState();
}

class _AddphotosState extends State<Addphotos> {

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () async{

            final results  = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['png' , 'jpg' ,'jpeg'],
            );
            if(results == null){
              Get.snackbar("Error", "Select the image Properly");
              return null;
            }
            final path = results.files.single.path!;
            final fileName =results.files.single.name;
            storage.uploadFile(path, fileName).then((value) => print('Done'));
          }, child: Text("Add Photos")),
          FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context ,
              AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
               return Container(
                 height: 100,
               child: ListView.builder(
                   scrollDirection:  Axis.horizontal,
                   itemCount: snapshot.data!.items.length,
               itemBuilder: (BuildContext context , int index){
                 return ElevatedButton(onPressed: (){}, child: Text(snapshot.data!.items[index].name),);}

               ),
               );
              }
              if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                return CircularProgressIndicator();
                }
                return Container();
  }
  ),
          FutureBuilder(
              future: storage.downloadUrl('IMG20221002173957.jpg'),
              builder: (BuildContext context ,
                  AsyncSnapshot<String> snapshot) {
                if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  return Container(
                   width: 300,
                    height: 250,
                    child: Image.network(snapshot.data!, fit: BoxFit.cover),

                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return Container();
              }
          )
      ]
      ),
    );
  }
}