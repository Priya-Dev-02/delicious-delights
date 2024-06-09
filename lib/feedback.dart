import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receipe_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackPage(),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();
  double _rating = 0;

  void _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      final feedback = _feedbackController.text;
      await FirebaseFirestore.instance.collection('feedback').add({
        'message': feedback,
        'rating': _rating,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _feedbackController.clear(); // Clear text field
      setState(() {
        _rating = 0; // Reset rating
      });
      // Show a success message or navigate to another screen.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feedback Page'),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.orange[400]!,
                  Colors.orange[300]!,
                  Colors.orange[200]!,
                  Colors.orange[100]!,
                ],
              ),
            ),
            child: Center(
                child: Card(
              margin: EdgeInsets.all(16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'Feedback',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _feedbackController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your feedback';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Your Feedback',
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text('Rate the app:'),
                                SizedBox(width: 10),
                                Row(
                                  children: List.generate(5, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _rating =
                                              index + 1; // Update the rating
                                        });
                                      },
                                      child: Icon(
                                        Icons.star,
                                        color: index < _rating
                                            ? Colors.yellow
                                            : Colors.grey,
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                              Colors.orange[400]!,
                              Colors.orange[300]!,
                              Colors.orange[200]!,
                              Colors.orange[100]!,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          onPressed: _submitFeedback,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Submit Feedback',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ))));
  }
}
