import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:restorantakip/servis/Veriekleme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UruneklePage extends StatefulWidget {
  @override
  _UruneklePageState createState() => _UruneklePageState();
}

class _UruneklePageState extends State<UruneklePage> {
  TextEditingController adController = TextEditingController();
  TextEditingController aciklamaController = TextEditingController();
  Veriekleme _veriekleme = Veriekleme();

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _Resimsec;
  var profilResmi;

  Widget ResimYeri() {

    if (profilResmi != null) {
      return Image.file(
          File(profilResmi!.path),
        width: 250,
        height: 180,
        fit: BoxFit.fill,
      );
    }
    else {
      if (_Resimsec != null) {
        return Image.file(
          File(profilResmi!.path),
          width: 250,
          height: 180,
          fit: BoxFit.fill,
        );
      } else
        return Container(
            width: 250,
            height: 180,
            child: const Image(
                image: AssetImage('images/siyah.png'),fit: BoxFit.fill,
            )
        );

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2C975),
          appBar: AppBar(
            title: Text("Yemek Ekle"),
            centerTitle: true,
            elevation: 10,
            backgroundColor: Color(0xffDD825D),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                            controller: adController,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight:
                            FontWeight.bold,fontSize: 23,fontStyle: FontStyle.italic,),
                            decoration: InputDecoration(
                              hintText: "Yemek Adını Giriniz",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,
                                  color: Color(0xffFA9448), fontSize: 23),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 5, color: Colors.white),
                                  borderRadius: BorderRadius.circular(50.0)
                                ),
                            )),
                        TextField(
                            controller: aciklamaController,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 23,fontStyle: FontStyle.italic,),
                            decoration: InputDecoration(
                              hintText: "Yemek İçeriğini Giriniz",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFA9448), fontSize: 23),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 5, color:  Colors.white),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(margin:EdgeInsets.only(right: 30),
                              child: ResimYeri(),
                            ),
                            InkWell(
                                onTap: () => _ButonaBasildiginda(
                                    ImageSource.camera,
                                    context: context),
                                child: Container(
                                  margin: EdgeInsets.only(top: 150),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Color(0xffED553B),
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => _ButonaBasildiginda(
                                    ImageSource.gallery,
                                    context: context),
                                child: Container(
                                  margin: EdgeInsets.only(top: 150 ,right: 10),
                                  child: Icon(
                                    Icons.image,
                                    size: 30,
                                    color: Color(0xffED553B),
                                  ),
                                ))

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                          child: InkWell(
                            onTap: () {
                              _veriekleme
                                  .yemekekle( adController.text,aciklamaController.text, profilResmi ?? '')
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: "Ürün Eklendi!",
                                    timeInSecForIosWeb: 2,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.grey[600],
                                    textColor: Colors.white,
                                    fontSize: 14);
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 50) ,
                              width: MediaQuery.of(context).size.width/1.5,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors:[ Color(0xfff1615e),Color(0xffefec4f),]),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color:Color(0xff2d2f3a),
                                    offset: Offset(1,5),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                             child: Center(
                                 child: Text("EKLE",style: GoogleFonts.quicksand(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }

  void _ButonaBasildiginda(ImageSource source,
      {required BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        final File? imagefile= File(pickedFile!.path);
        final PickedFile image = PickedFile(imagefile!.path);
        profilResmi = image;
        print("dosyaya geldim: $profilResmi");
        if (profilResmi != null) {}
      });
      print('aaa');
    } catch (e) {
      setState(() {
        _Resimsec = e;
        print("Image Error: " + _Resimsec);
      });
    }
  }
}