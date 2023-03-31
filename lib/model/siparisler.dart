import 'package:cloud_firestore/cloud_firestore.dart';

class Siparis {
  String id;
  String yemekad;
  String yemekaciklama;
  String resim;

  Siparis({required this.id, required this.yemekad,
    required this.yemekaciklama, required this.resim});

  factory Siparis.fromSnapshot(DocumentSnapshot snapshot) {
    return Siparis(
      id: snapshot.id,
      yemekad: snapshot["yemekad"],
      yemekaciklama: snapshot["yemekaciklama"],
      resim: snapshot["resim"],
    );
  }
}