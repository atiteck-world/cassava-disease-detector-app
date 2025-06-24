import 'dart:io';
import 'package:disease_detection_app/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputScreen extends StatefulWidget{
  const ImageInputScreen({super.key});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

class _ImageInputScreenState extends State<ImageInputScreen>{
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if(pickedFile != null){
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(imageFile: File(pickedFile.path))),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text(
          "Image Preview",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _imageFile != null
                ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                _imageFile!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
                : const Text("No image selected."),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text("Capture Image"),
              style: ElevatedButton.styleFrom(
                //backgroundColor: Colors.green.shade700,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.image),
              label: const Text("Pick from Gallery"),
              style: ElevatedButton.styleFrom(
                //backgroundColor: Colors.green.shade600,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}