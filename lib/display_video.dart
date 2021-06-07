import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'firebase_file.dart';
import 'video_player_widget.dart';

class ImagePage extends StatefulWidget {
  final FirebaseFile file;
  
  const ImagePage({
    Key key,
    this.file,
  }) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
     VideoPlayerController controller;


   @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.file.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isImage = ['.mp4'].any(widget.file.name.contains);
    

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file.name),
        centerTitle: true,
      ),
      body: isImage
          ? VideoPlayerWidget(controller: controller)                                
          : Center(
              child: Text(
                'Cannot be displayed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}