import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreData {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadVideo(String videoPath) async {
    try {
      Reference ref = _storage.ref().child('videos/${DateTime.now()}.mp4');
      await ref.putFile(File(videoPath));

      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw Exception('Failed to upload video: $e');
    }
  }
  Future<void> saveVideoData(String videoDownloadUrl) async {
    try {
      await _firestore.collection('videos').add({
        'url': videoDownloadUrl,
        'timeStamp': FieldValue.serverTimestamp(),
        'name': 'My Media',
      });
    } catch (e) {
      throw Exception('Failed to save video data: $e');
    }
  }
}
