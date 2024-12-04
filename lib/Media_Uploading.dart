import 'package:authentication/Save_Video.dart';
import 'package:authentication/Screens/Video_lists.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'resources/Save_Video.dart';

class MediaUploading extends StatefulWidget {
  const MediaUploading({super.key});

  @override
  State<MediaUploading> createState() => _MediaUploadingState();
}

class _MediaUploadingState extends State<MediaUploading> {
  String? _videoURL;
  VideoPlayerController? _controller;
  String? _downloadURL;
  bool _isUploading = false;

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
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            ),
          ),
           SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _isUploading ? null : _uploadVideo,
            style: ElevatedButton.styleFrom(
              padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            icon: _isUploading
                ?  SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                  color: Colors.white, strokeWidth: 2),
            )
                :  Icon(Icons.cloud_upload),
            label: Text(_isUploading ? 'Uploading...' : 'Upload Video'),
          ),
        ],
      );
    } else {
      return  Center(
        child: Text(
          'Loading Video...',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      );
    }
  }

  Future<void> _uploadVideo() async {
    if (_videoURL == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      _downloadURL = await StoreData().uploadVideo(_videoURL!);
      await StoreData().saveVideoData(_downloadURL!);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Video uploaded successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      _controller?.dispose();
      setState(() {
        _videoURL = null;
        _controller = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading video: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text(
          "Content Uploader",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  VideoList(),
                ),
              );
            },
            icon:  Icon(
              Icons.history,
              color: Colors.white,
              size: 26,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _videoURL != null
                ? _videoPreviewWidget()
                :  Center(
                  child: Text(
                                'No Video Selected',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: _pickVideo,
        label:  Text('Pick Video'),
        icon:  Icon(Icons.video_library),
      ),
    );
  }
}
