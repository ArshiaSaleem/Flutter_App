import 'package:flutter/material.dart';
import '../widgets/review_dialog.dart';  // Import the ReviewDialog widget

class ReviewAssignmentScreen extends StatelessWidget {
  final String assignmentName;

  ReviewAssignmentScreen({required this.assignmentName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Your Peer\'s Assignment'),
        backgroundColor: Color(0xFF5B21B6),
        foregroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignmentName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ReviewFileCard(fileName: 'file1.pdf'),
                  ReviewFileCard(fileName: 'file2.pdf'),
                  ReviewFileCard(fileName: 'file3.pdf'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewFileCard extends StatelessWidget {
  final String fileName;

  ReviewFileCard({required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(fileName),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ReviewDialog();
                  },
                );
              },
              child: Text('Add Your Review'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5B21B6),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
