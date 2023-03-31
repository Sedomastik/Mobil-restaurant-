import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class medyadepolama{
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //Resim ekleme fonksiyonu
      Future<String> medyayukle(File file) async{
      var gorevyukle = _firebaseStorage.ref().child("${DateTime.now().millisecondsSinceEpoch}"
          ".${file.path.split('.').last}").putFile(file);
      
      gorevyukle.snapshotEvents.listen((event) { });

      var url = await(await gorevyukle).ref.getDownloadURL();
      return url;
    }
}