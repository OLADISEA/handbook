import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../config/app_colors.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _rating = 0.0;
  final TextEditingController _commentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // Survey Questions Responses
  String? _satisfaction;
  String? _accuracy;
  String? _easeOfUse;
  String? _recommend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rate your experience:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),

              // Rating bar to give feedback
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Question 1: Satisfaction
              const Text('How satisfied are you with the responses provided by the chatbot?'),
              const SizedBox(height: 10),
              _buildRadioGroup(
                value: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = value;
                  });
                },
                options: {
                  'Very satisfied': 'Very satisfied',
                  'Satisfied': 'Satisfied',
                  'Neutral': 'Neutral',
                  'Dissatisfied': 'Dissatisfied',
                  'Very dissatisfied': 'Very dissatisfied',
                },
              ),
              const SizedBox(height: 20),

              // Question 2: Accuracy
              const Text('Do you feel that the chatbot provided accurate information about your queries (admission/program)?'),
              const SizedBox(height: 10),
              _buildRadioGroup(
                value: _accuracy,
                onChanged: (value) {
                  setState(() {
                    _accuracy = value;
                  });
                },
                options: {
                  'Yes': 'Yes',
                  'No': 'No',
                },
              ),
              const SizedBox(height: 20),

              // Question 3: Ease of Use
              const Text('How easy was it to use the chatbot?'),
              const SizedBox(height: 10),
              _buildRadioGroup(
                value: _easeOfUse,
                onChanged: (value) {
                  setState(() {
                    _easeOfUse = value;
                  });
                },
                options: {
                  'Very easy': 'Very easy',
                  'Easy': 'Easy',
                  'Neutral': 'Neutral',
                  'Difficult': 'Difficult',
                  'Very difficult': 'Very difficult',
                },
              ),
              const SizedBox(height: 20),

              // Question 4: Recommendation
              const Text('Would you recommend the chatbot to other prospective students?'),
              const SizedBox(height: 10),
              _buildRadioGroup(
                value: _recommend,
                onChanged: (value) {
                  setState(() {
                    _recommend = value;
                  });
                },
                options: {
                  'Yes': 'Yes',
                  'No': 'No',
                },
              ),
              const SizedBox(height: 20),

              // Comment section
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Additional comments or suggestions',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Submit Feedback',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for survey questions
  Widget _buildRadioGroup({
    required String? value,
    required Function(String?) onChanged,
    required Map<String, String> options,
  }) {
    return Column(
      children: options.entries.map((entry) {
        return RadioListTile<String>(
          value: entry.value,
          groupValue: value,
          onChanged: onChanged,
          title: Text(entry.key),
        );
      }).toList(),
    );
  }

  void _submitFeedback() {
    if (_rating == 0.0 && _satisfaction == null && _commentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide feedback or a rating.')),
      );
      return;
    }

    // Store the feedback, rating, and responses (you can send this service to a server or save locally)
    print('Rating: $_rating');
    print('Satisfaction: $_satisfaction');
    print('Accuracy: $_accuracy');
    print('Ease of Use: $_easeOfUse');
    print('Recommend: $_recommend');
    print('Comments: ${_commentController.text}');

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your feedback!')),
    );

    // Optionally clear the form
    setState(() {
      _rating = 0.0;
      _satisfaction = null;
      _accuracy = null;
      _easeOfUse = null;
      _recommend = null;
      _commentController.clear();
    });
  }
}
