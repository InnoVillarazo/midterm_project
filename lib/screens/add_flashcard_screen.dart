import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../models/flashcard_deck.dart';

class AddFlashcardScreen extends StatefulWidget {
  final FlashcardDeck deck;
  final Function(Flashcard) onAddFlashcard;

  AddFlashcardScreen({required this.deck, required this.onAddFlashcard});

  @override
  _AddFlashcardScreenState createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Flashcard'),
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
              child: Text('Add Flashcard'),
              onPressed: () {
                if (_questionController.text.isNotEmpty &&
                    _answerController.text.isNotEmpty) {
                  Flashcard newFlashcard = Flashcard(
                    question: _questionController.text,
                    answer: _answerController.text,
                  );
                  widget.onAddFlashcard(newFlashcard);
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
