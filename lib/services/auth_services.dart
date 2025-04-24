import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth == null) return null;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user; 
    } catch (e) {
      print('Google sign-in failed: $e');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}

/**
home: StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
    if(snapshot.hasError)
      return Text(snapshot.error.toString());
    
    if(snapshot.connectionState==ConnectionState.active){
      if(snapshot.data==null)
        return LoginPage()
      else
        return HomePage(title: FirebaseAuth.instance.currentUser!.displayName)
      }
    return Center(child: CircularProgressIndicator(),)
)

actions: [
  IconButton(onPressed: () async{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }, icon: Icon(Icons.power_settings_new))
],
**/