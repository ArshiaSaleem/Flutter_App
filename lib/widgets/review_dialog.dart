import 'package:flutter/material.dart';

class ReviewDialog extends StatefulWidget {
  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _marksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Color(0xFFF3F4F6), // Set background color of the dialog
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Review for Submission',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        content: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
        Text('Comments:'),
    SizedBox(height: 8),
    TextField(
    controller: _commentsController,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter your comments here...',
    ),
    maxLines: 3,
    ),
    SizedBox(height:             16),
          Text('Marks:'),
          SizedBox(height: 8),
          TextField(
            controller: _marksController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter mark from 1 to 10',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
        ),
        ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Implement save review functionality here
            Navigator.of(context).pop();
          },
          child: Text('Save Review'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF5B21B6), // Set button background color
            foregroundColor: Colors.white, // Set button text color
          ),
        ),
      ],
    );
  }
}
