import 'package:restorantakip/sayfalar/Urunekle.dart';
import 'package:restorantakip/sayfalar/giris.dart';
import 'package:restorantakip/sayfalar/siparis.dart';
import 'package:restorantakip/servis/auth.dart';
import 'package:flutter/material.dart';
import 'package:restorantakip/sayfalar/Listeleme.dart';

class AnasayfaPage extends StatefulWidget {
  @override
  _AnasayfaPage createState() => _AnasayfaPage();
}

class _AnasayfaPage extends State<AnasayfaPage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffF2C975),
          appBar: AppBar(
            title: const Text("Hacı Kemal'in Yeri"),
            centerTitle: true,
            toolbarHeight: 60,
            toolbarOpacity: 1,
            elevation: 10,
            backgroundColor: Color(0xffDD825D),
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Text("Yemek Ekle"),
            icon: Icon(Icons.add),
            backgroundColor: Color(0xffF8B500),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UruneklePage()));
            },

          ),
          drawer: Drawer(
            backgroundColor: Color(0xffF2B680),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xffFCDCA3),
                  ),
                  accountName: Text("Serdar"),
                  accountEmail: Text("Serdaryuksek3457@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/beyaz.png"),
                  ),
                ),
                ListTile(
                  title: Text('Anasayfa'),
                  textColor: Colors.white,
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Profilim'),
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.person),
                ),
                Divider(),
                ListTile(
                  title: Text('Çıkış yap'),
                  textColor: Colors.white,
                  onTap: () {
                    _authService.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GirisSayfasi()));
                  },
                  leading: Icon(Icons.remove_circle),
                ),
              ],
            ),
          ),

          body: Column(
            children: [
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                Text("Yemek Listesi", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17,color: Colors.deepOrange)),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ],
              ),
              Container(
                height: 250,
                    child: ListelemePage(),
              ),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
                Text("Aktif Siparişler", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17,color: Colors.deepOrange)),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.black,
                        height: 50,
                      )),
                ),
              ],
              ),
              Container(
                height: 250,
                child: siparisPage(),
              )
            ],
          ),

      ),

    );
  }
}