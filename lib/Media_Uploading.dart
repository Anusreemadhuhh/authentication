import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MediaUploading extends StatefulWidget {
  const MediaUploading({super.key});

  @override
  State<MediaUploading> createState() => _MediaUploadingState();
}

class _MediaUploadingState extends State<MediaUploading> {
  String? _videoURL;
  VideoPlayerController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _pickVideo() async {
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _videoURL = pickedFile.path;
      });
      _initializeVideoPlayer();
    }
  }

  Future<void> _initializeVideoPlayer() async {
    if (_videoURL != null) {
      _controller = VideoPlayerController.file(File(_videoURL!))
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    }
  }

  Widget _videoPreviewWidget() {
    if (_controller != null && _controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!),
      );
    } else {
      return  CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("VIDEO UPLOADER",style: TextStyle(fontSize: 18,color: Colors.black),),
      ),
      body: Center(
        child: _videoURL != null
            ? _videoPreviewWidget()
            :  Text('No Video Selected'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickVideo,
        child:  Icon(Icons.video_library),
      ),
    );
  }
}
