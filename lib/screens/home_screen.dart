import 'package:flutter/material.dart';

import 'disease_info_screen.dart';
import 'history_screen.dart';
import 'image_input_screen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: const Icon(Icons.eco, color: Colors.white),
        title: const Text(
          "Crop Disease Detector",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if(value == 'info'){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DiseaseInfoScreen()),
                );
              }else if (value == 'history'){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'info', child: Text("Disease Info")),
              const PopupMenuItem(value: 'history', child: Text("Scan History")),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/cassava_leaf.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ImageInputScreen())
                  );
                },
                label: const Text("Take Image of Cassava Leaf"),
                icon: const Icon(Icons.camera_alt),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  //backgroundColor: Colors.green.shade700,
                ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Upload a cassava leaf to detect disease",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
    );
  }
}