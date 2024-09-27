import 'package:flutter/material.dart';
import '../models/flashcard_deck.dart';

class AddDeckScreen extends StatefulWidget {
  final Function(FlashcardDeck) onAddDeck;

  AddDeckScreen({required this.onAddDeck});

  @override
  _AddDeckScreenState createState() => _AddDeckScreenState();
}

class _AddDeckScreenState extends State<AddDeckScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Deck'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Deck Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
              child: Text('Add Deck'),
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  widget.onAddDeck(FlashcardDeck(title: _titleController.text));
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
