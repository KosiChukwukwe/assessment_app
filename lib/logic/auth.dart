import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:assessment_app/utils/failure.dart';


class Auth{

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserCredential> register ({ required String email, required String password,  required String userName,}) async{
    try{
      var credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(userName);
      await credential.user!.sendEmailVerification();
      return credential;
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }


  Future<UserCredential> login ({required String email, required String password}) async{
    try{
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      if (!credential.user!.emailVerified) {
        await auth.signOut();
        throw Failure(message: 'Email is not verified');
      }
      return credential;
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }

  Future<void> resetPassword ({required String email}) async{
    try{
      return auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }



  Future<void> deleteAccount () async{
    try{
      return auth.currentUser?.delete();
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }

  Future<void> updateEmail ({required String oldEmail, required String newEmail}) async{
    final user = auth.currentUser;
    var methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(oldEmail);
    if (methods.contains('password')) {
      try{
        return auth.currentUser?.updateEmail(newEmail);
      }
     on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
    }
  }

  Future<void> updatePassword ({required String oldPassword, required String newPassword}) async{
    final user = auth.currentUser;
    final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: oldPassword);
    try{
      await user.reauthenticateWithCredential(credential);
      return auth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }

  Future<void> updateUsername ({required String newUsername}) async{
    try{
      return auth.currentUser?.updateDisplayName(newUsername);
    } on FirebaseAuthException{
      throw Failure(message: "Firebase Authentication failed.");
    } on SocketException{
      throw Failure(message: "You're not connected to the internet. ");
    }
    catch(e){
      throw Failure(message: e.toString());
    }
  }
}


