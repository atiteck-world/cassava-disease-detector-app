import 'dart:io';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // Dummy history list (you'll replace this with Firestore or local storage)
  final historyData = const [
    {
      "imagePath": "assets/leaf1.jpeg",
      "disease": "Cassava Mosaic Virus",
      "date": "2025-06-24"
    },
    {
      "imagePath": "assets/leaf2.jpeg",
      "disease": "Cassava Brown Streak",
      "date": "2025-06-22"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan History"),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          final item = historyData[index];
          return ListTile(
            leading: Image.asset(item["imagePath"]!, width: 60, fit: BoxFit.cover),
            title: Text(item["disease"]!),
            subtitle: Text("Date: ${item["date"]}"),
          );
        },
      ),
    );
  }
}
