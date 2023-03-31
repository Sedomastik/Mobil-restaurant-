import 'package:google_fonts/google_fonts.dart';
import 'package:restorantakip/servis/Veriekleme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class siparisPage extends StatefulWidget {
  @override
  _siparisPageState createState() => _siparisPageState();
}

class _siparisPageState extends State<siparisPage> {
  Veriekleme _veriekleme = Veriekleme();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return StreamBuilder<QuerySnapshot>(
      stream: _veriekleme.siparisgetir(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? CircularProgressIndicator()
            : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot mypost = snapshot.data!.docs[index];

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * .23,
                      decoration: BoxDecoration(
                          color: Color(0xffFFF4E0),
                          border: Border.all(color: Color(0xff393E46), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 50,
                                    child: Text(
                                      "${mypost['yemekad']}",
                                      style: GoogleFonts.quicksand(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 70,
                                    child: Text(
                                      "${mypost['yemekaciklama']}",
                                      style: GoogleFonts.quicksand(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ]
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 110,
                                  child: Image(
                                    image: NetworkImage(mypost['resim']),fit: BoxFit.fill,
                                  ),
                                ),

                                    InkWell(
                                      onTap: () => _veriekleme.siparisSil(mypost.id),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5) ,
                                        width: MediaQuery.of(context).size.width/3.0,
                                        height: 35,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors:[ Color(0xffff5f5f),Color(0xfffda500),]),
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:Color(0xff2d2f3a),
                                              offset: Offset(1,5),
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                        child: Text("TAMAMLANDI",textAlign: TextAlign.center, style: GoogleFonts.quicksand(color:Colors.black,fontSize: 12,fontWeight:FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
            });
      },
    );
  }
}