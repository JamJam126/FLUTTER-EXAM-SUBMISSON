import 'package:final_exam/models/restaurant_comment.dart';
import 'package:flutter/material.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({super.key});

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  final _feedbackController = TextEditingController();
  List<int> ratings = [0, 1, 2, 3, 4, 5];
  int selectedRating = 0;

  void dispose(){
    super.dispose();
    _feedbackController.dispose();
  }

  void _showMyDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Input'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void onCreate() {
    String feedbacks = _feedbackController.text;
    if (feedbacks.isEmpty) {
      _showMyDialog('Feedback must be entered');
      return;
    }

    final newComment = RestaurantComment(
      feedbacks: feedbacks,
      stars: selectedRating
    );
    Navigator.pop(context, newComment);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('How was your dinner?', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            DropdownButtonFormField(
              value: selectedRating,
              items: ratings.map((rating) {
                return DropdownMenuItem(
                  value: rating,
                  child: Text(rating.toString())
                );
              }).toList(), 
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedRating = value;
                });
              }
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _feedbackController,
              decoration:  const InputDecoration(label: Text('Any Feedbacks')),
              maxLength: 50,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: onCreate,
                  child: const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
