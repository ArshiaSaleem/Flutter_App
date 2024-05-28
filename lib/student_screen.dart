import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'review_assignment_screen.dart';  // Import the new screen
import 'widgets/peer_reviews_dialog.dart';  // Import the PeerReviewsDialog

void main() {
  runApp(MaterialApp(
    home: StudentScreen(email: 'student@example.com'),
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFF5B21B6),
        secondary: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onPrimary: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      appBarTheme: AppBarTheme(
        color: Color(0xFF5B21B6),
        backgroundColor: Colors.yellow
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Color(0xFF5B21B6)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5B21B6),
          foregroundColor: Colors.white,
        ),
      ),
      cardTheme: CardTheme(
        color: Color(0xFFF3F4F6),
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  ));
}

class StudentScreen extends StatelessWidget {
  final String email;

  StudentScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Course Management App', style: TextStyle(
              color: Colors.white
          ),),
          backgroundColor: Color(0xFF5B21B6),
        actions: [
          TextButton(
            onPressed: () {
              // Implement logout functionality here
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Welcome Back, Arshia',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Your Due Assignments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            AssignmentCard(
              title: 'Reflection on Green IT',
              description: 'Write reflection of no more than one page.',
              dueDate: 'June 1st, 2024',
              course: 'Sustainability & IT',
            ),
            AssignmentCard(
              title: 'SusAF Report',
              description: 'Perform SusAF on any IT Service and submit doc.',
              dueDate: 'June 5th, 2024',
              course: 'Capstone Project',
            ),
            AssignmentCard(
              title: 'Research Paper Section',
              description: 'Submit Related Work section for your paper.',
              dueDate: 'June 20th, 2024',
              course: 'Personal Literature',
            ),
            SizedBox(height: 20),
            Text(
              'Assignments Available for Review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ReviewAssignmentCard(title: 'Business Model Canvas'),
            ReviewAssignmentCard(title: 'Industry Seminar Reflection'),
            ReviewAssignmentCard(title: 'Software Quality Assurance'),
            SizedBox(height: 20),
            Text(
              'Submitted Assignments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SubmissionCard(
              title: 'Market Analysis',
              description: 'Submit presentation on your Market Analysis',
              dueDate: 'June 1st, 2024',
              course: 'Software Innovation',
              gradeStatus: 'Pending',
              onViewReviews: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PeerReviewsDialog(
                      assignmentName: 'Market Analysis',
                      averageScore: '83.33',
                      reviews: [
                        {
                          'comments': 'Great work! The explanation was clear and concise.',
                          'marks': '85'
                        },
                        {
                          'comments': 'Good effort, but there were some points missing.',
                          'marks': '75'
                        },
                        {
                          'comments': 'Excellent presentation, well done!',
                          'marks': '90'
                        },
                      ],
                    );
                  },
                );
              },
            ),
            SubmissionCard(
              title: 'SDG Report',
              description: 'Submit report on role of IT in SDGs',
              dueDate: 'June 1st, 2024',
              course: 'Sustainability & IT',
              gradeStatus: 'Pending',
              onViewReviews: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PeerReviewsDialog(
                      assignmentName: 'SDG Report',
                      averageScore: '83.33',
                      reviews: [
                        {
                          'comments': 'Great work! The explanation was clear and concise.',
                          'marks': '85'
                        },
                        {
                          'comments': 'Good effort, but there were some points missing.',
                          'marks': '75'
                        },
                        {
                          'comments': 'Excellent presentation, well done!',
                          'marks': '90'
                        },
                      ],
                    );
                  },
                );
              },
            ),
            SubmissionCard(
              title: 'Literature Review Protocol',
              description: 'Submit pdf document of your protocol.',
              dueDate: 'June 1st, 2024',
              course: 'Personal Literature',
              gradeStatus: 'Pending',
              onViewReviews: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PeerReviewsDialog(
                      assignmentName: 'Personal Literature',
                      averageScore: '83.33',
                      reviews: [
                        {
                          'comments': 'Great work! The explanation was clear and concise.',
                          'marks': '85'
                        },
                        {
                          'comments': 'Good effort, but there were some points missing.',
                          'marks': '75'
                        },
                        {
                          'comments': 'Excellent presentation, well done!',
                          'marks': '90'
                        },
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatefulWidget {
  final String title;
  final String description;
  final String dueDate;
  final String course;

  AssignmentCard({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.course,
  });

  @override
  _AssignmentCardState createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  String? _fileName;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _fileName = result.files.single.name;
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF3F4F6),  // Ensure card background is #f3f4f6
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.dueDate,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(widget.description),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.course,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Choose File'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF3F4F6), // Match button background to card background
                    foregroundColor: Colors.black, // Text color
                  ),
                ),
                if (_fileName != null) Text(_fileName!),
                ElevatedButton(
                  onPressed: () {
                    // Implement submit functionality here
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor, // Color for the 'Submit' button
                    foregroundColor: Colors.white, // Text color for the 'Submit' button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewAssignmentCard extends StatelessWidget {
  final String title;

  ReviewAssignmentCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ReviewAssignmentScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewAssignmentScreen(
              assignmentName: title,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity, // Make the card take full width
        margin: EdgeInsets.symmetric(vertical: 5), // Add margin for spacing between cards
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SubmissionCard extends StatelessWidget {
  final String title;
  final String description;
  final String dueDate;
  final String course;
  final String gradeStatus;
  final VoidCallback onViewReviews;

  SubmissionCard({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.course,
    required this.gradeStatus,
    required this.onViewReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF3F4F6),  // Ensure card background is #f3f4f6
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  dueDate,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                course,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Teacher Grade: $gradeStatus',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                ElevatedButton(
                  onPressed: onViewReviews,
                  child: Text('See Peer Reviews'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColor,
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
