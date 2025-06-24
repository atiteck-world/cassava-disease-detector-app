import 'dart:io';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget{
  final File imageFile;
  
  const ResultScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    // Dummy prediction (simulate delay/future logic later)
    const disease = "Cassava Mosaic Virus";
    const confidence = "98.6%";
    const recommendation =
        "• Destroy infected plants\n• Use certified disease-free cuttings\n• Rotate cassava with non-host crops";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: const Text("Prediction Result", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                imageFile,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Detected Disease: ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              disease,
              style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            ),
            const SizedBox(height: 10),
            Text("Confidence: $confidence"),
            const SizedBox(height: 20),
            const Text(
              "Recommendations:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(recommendation),
          ],
        ),
      ),
    );
  }
  
}