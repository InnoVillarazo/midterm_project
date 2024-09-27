import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../screens/edit_flashcard_screen.dart';

class FlashcardScreen extends StatefulWidget {
  final Flashcard flashcard;
  final VoidCallback onDelete;

  FlashcardScreen({required this.flashcard, required this.onDelete});

  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFlashcardScreen(
                    flashcard: widget.flashcard,
                    onEdit: (updatedFlashcard) {
                      setState(() {
                        widget.flashcard.question = updatedFlashcard.question;
                        widget.flashcard.answer = updatedFlashcard.answer;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Flashcard updated!')),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.onDelete();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Flashcard deleted!')));
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              showAnswer = !showAnswer;
            });
          },
          child: Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                showAnswer
                    ? widget.flashcard.answer
                    : widget.flashcard.question,
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
