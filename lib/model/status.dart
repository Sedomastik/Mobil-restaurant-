import 'package:cloud_firestore/cloud_firestore.dart';

class Status {
  String id;
  String ad;
  String aciklama;
  String resim;

  Status({required this.id, required this.ad, required this.aciklama, required this.resim});

  factory Status.fromSnapshot(DocumentSnapshot snapshot) {
    return Status(
      id: snapshot.id,
      ad: snapshot["ad"],
      aciklama: snapshot["aciklama"],
      resim: snapshot["resim"],
    );
  }
}
