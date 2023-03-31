import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restorantakip/servis/auth.dart';
import 'package:restorantakip/sayfalar/Anasayfa.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();

}

class _GirisSayfasiState extends State<GirisSayfasi> {
  bool sifre_gozukme = true;
  AuthService _authService = AuthService();
  final TextEditingController _epostaController =TextEditingController();
  final TextEditingController _sifreController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xff3E4050),
        ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  margin: EdgeInsets.only(top:50),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white.withOpacity(0.2),
                      width: 1,
                    )
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Color(0xff2D2F3A),
                          width: 15,
                        )
                    ),
                    child: Icon(
                        Icons.login,
                        size: 45,
                    ),
                  ) ,
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: Text(
                      "Giriş Yapın",
                      style: GoogleFonts.quicksand(
                          color:Colors.white,
                          fontSize: 30,
                      ),

               ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff333443),
                      borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(top: 30,bottom: 10,right: 30,left: 30) ,
                  padding: EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                  child: TextFormField(
                    controller: _epostaController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-Posta Adresinizi Girin ",
                      hintStyle: GoogleFonts.quicksand(
                        color: Color(0xff7f8c99),
                      ),
                      prefixIcon: Icon(
                          Icons.people_alt_outlined,
                         color: Color(0xff5ba7fb),
                      ),
                    ),
                    style: GoogleFonts.quicksand(
                      color: Color(0xff7f8c99),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff333443),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(top: 5,bottom: 30,right: 30,left: 30),
                  padding: EdgeInsets.only(left: 15,top: 5,right: 15,bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _sifreController,
                          obscureText: sifre_gozukme,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Şifrenizi Girin",
                            hintStyle: GoogleFonts.quicksand(
                              color: Color(0xff7f8c99),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key_outlined,
                              color: Color(0xff5ba7fb),

                            ),
                          ),
                          style: GoogleFonts.quicksand(
                            color: Color(0xff7f8c99),
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      IconButton(onPressed:() {
                        setState(() {
                          sifre_gozukme=!sifre_gozukme;
                        });
                      },
                        icon: Icon(
                         sifre_gozukme? Icons.remove_red_eye : Icons.close,
                          color: Color(0xff7f8c99),
                        ),
                      ),
                    ],
                  ),
                ),
              InkWell(
                onTap: (){
                  _authService.signIn(_epostaController.text, _sifreController.text).then((value){
                    return Navigator.push(context, MaterialPageRoute(builder:(context) => AnasayfaPage()));
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50) ,
                  width: MediaQuery.of(context).size.width/1.5,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[ Color(0xff224abe),Color(0xff4e73df),]),
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
                    child: Text("GİRİŞ YAP",style: GoogleFonts.quicksand(color:Colors.white,fontSize: 20,),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),

      ),
      ),
    );
  }
}