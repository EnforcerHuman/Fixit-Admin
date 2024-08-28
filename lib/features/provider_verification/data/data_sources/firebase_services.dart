import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  FirebaseServices() {
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Stream<QuerySnapshot> getServiceProviders() {
    final firestore = FirebaseFirestore.instance;
    return firestore.collection('ServiceProviders').snapshots();
  }

  Future<void> updateIsVerified(String docId, bool isVerified) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final documentReference =
          firestore.collection('ServiceProviders').doc(docId);

      await documentReference.update({'isVerified': isVerified});
    } catch (e) {
      //handle exception
    }
  }

  Stream<QuerySnapshot> getUnverifiedServiceProviders() {
    return FirebaseFirestore.instance
        .collection('ServiceProviders')
        .where('isVerified', isEqualTo: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getVerifiedServiceProviders() {
    return FirebaseFirestore.instance
        .collection('ServiceProviders')
        .where('isVerified', isEqualTo: true)
        .snapshots();
  }

  Future<String> getImageUrl(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) {
      throw Exception('Image path is null or empty');
    }

    try {
      final ref = FirebaseStorage.instance.ref(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }
}
