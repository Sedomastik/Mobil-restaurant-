import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restorantakip/model/siparisler.dart';
import 'package:restorantakip/model/status.dart';
import 'package:restorantakip/servis/medyadepolama.dart';

class Veriekleme{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  medyadepolama _medyadepolama = medyadepolama();
  String mediaUrl ="";
  final picker = ImagePicker();


  //Database'e yemek ekleme fonksiyonu
  Future<Status> yemekekle(String ad, String aciklama, PickedFile pickedFile )async{
    var ref = _firestore.collection("Status");

    if(pickedFile==null)
    {
      mediaUrl='';
    }
    else
    {

      mediaUrl= await _medyadepolama.medyayukle( File(pickedFile.path));
    }
    var dokumanref = await ref.add({
      'ad': ad,
      'aciklama': aciklama,
      'resim' : mediaUrl
    });
    return Status(id: dokumanref.id, ad: ad, aciklama: aciklama, resim: mediaUrl);
  }

  //Database'e Sipariş ekleme fonksiyonu
  Future<Siparis> siparisekle(String DocId)async{
     var ekle = _firestore.collection("Siparis");
     var ref = await _firestore.collection("Status").doc(DocId);
     var response = await ref.get();
     var list = response.data();

     await ekle.add({
      'yemekad': list?['ad'],
      'yemekaciklama':list?['aciklama'],
      'resim': list?['resim'],
    });
    return Siparis(id: DocId, yemekad: list?['ad'],yemekaciklama: list?['aciklama'], resim: list?['resim'],);
  }


  //Yemek Listeleme Fonksiyonu
    Stream<QuerySnapshot> yemekGetir(){
       var ref = _firestore.collection("Status").snapshots();
       return ref;
    }

    //Siparis Silme Fonksiyonu
    Future<void> siparisSil(String docId){
      var ref = _firestore.collection("Siparis").doc(docId).delete();
      return ref;
    }


  //Siparis Getirme Fonksiyonu
  Stream<QuerySnapshot> siparisgetir(){

    var ref = _firestore.collection("Siparis").snapshots();
    return ref;
  }
}