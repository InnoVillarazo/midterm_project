import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class EditFlashcardScreen extends StatefulWidget {
  final Flashcard flashcard;
  final Function(Flashcard) onEdit;

  EditFlashcardScreen({required this.flashcard, required this.onEdit});

  @override
  _EditFlashcardScreenState createState() => _EditFlashcardScreenState();
}

class _EditFlashcardScreenState extends State<EditFlashcardScreen> {
  late TextEditingController _questionController;
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.flashcard.question);
    _answerController = TextEditingController(text: widget.flashcard.answer);
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Flashcard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Answer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
              child: Text('Save Changes'),
              onPressed: () {
                if (_questionController.text.isNotEmpty &&
                    _answerController.text.isNotEmpty) {
                  Flashcard updatedFlashcard = Flashcard(
                    question: _questionController.text,
                    answer: _answerController.text,
                  );
                  widget.onEdit(updatedFlashcard);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
