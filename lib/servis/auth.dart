import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
    final FirebaseAuth _auth= FirebaseAuth.instance;

    //Giriş yap fonksiyonu
   Future<User?> signIn(String eposta, String sifre) async
    {
        var user = await _auth.signInWithEmailAndPassword(email: eposta, password: sifre);
        return user.user;
    }

    //Çıkış yap fonksiyonu
    signOut() async
    {
        return await _auth.signOut();
    }

}