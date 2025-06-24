import 'package:flutter/material.dart';

class DiseaseInfoScreen extends StatelessWidget {
  const DiseaseInfoScreen({super.key});

  final diseases = const [
    {
      "name": "Cassava Mosaic Virus",
      "symptoms": "Mottled leaves, stunted growth.",
      "prevention": "Use virus-free planting materials, remove infected plants."
    },
    {
      "name": "Cassava Brown Streak",
      "symptoms": "Brown streaks on stems, root rot.",
      "prevention": "Resistant varieties, good field sanitation."
    },
    {
      "name": "Cassava Bacterial Blight",
      "symptoms": "Leaf wilting, gum exudates on stems.",
      "prevention": "Crop rotation, clean tools, resistant varieties."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disease Information"),
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(disease["name"]!),
              subtitle: Text("Symptoms: ${disease["symptoms"]}\nPrevention: ${disease["prevention"]}"),
              isThreeLine: true,
              leading: const Icon(Icons.medical_services_outlined),
            ),
          );
        },
      ),
    );
  }
}
