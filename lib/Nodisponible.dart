import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewer extends StatefulWidget {
  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  String imagePath =
      'assets/audio/Nodisponible.jpg'; // Initialize the image path with an empty string

  void _displayImage(String newImagePath) {
    setState(() {
      imagePath = newImagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo'),
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: imagePath.isNotEmpty
            ? Image.asset(
                imagePath,
                fit: BoxFit.cover, // Adjust the fit as needed
              )
            : const SizedBox(), // Replace with an empty widget if you want to hide the screen when no image is loaded
      ),
    );
  }
}
