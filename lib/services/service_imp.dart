import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prod_dev_23/services/services.dart';

class ServiceImp implements Services {
  @override
  Future<void> resetPass({String? email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email ?? '');
  }

  @override
  Future<void> signin({String? mail, String? pass}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }

  @override
  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup({String? name, String? mail, String? pass}) async {
    UserCredential userc;
    userc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail ?? '', password: pass ?? '');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userc.user!.uid)
        .set({"mail": mail, "name": name, "id": userc.user!.uid});
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail ?? '', password: pass ?? '');
  }
}
