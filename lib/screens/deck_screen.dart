import 'package:flutter/material.dart';
import 'package:ui_code_challenge/models/flashcard.dart';
import '../models/flashcard_deck.dart';
import '../screens/add_flashcard_screen.dart';
import '../screens/edit_flashcard_screen.dart';
import '../screens/flashcard_screen.dart';

class DeckScreen extends StatelessWidget {
  final FlashcardDeck deck;
  final Function(Flashcard) onDeleteFlashcard;

  DeckScreen({required this.deck, required this.onDeleteFlashcard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deck.title),
      ),
      body: ListView.builder(
        itemCount: deck.flashcards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(deck.flashcards[index].question),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditFlashcardScreen(
                          flashcard: deck.flashcards[index],
                          onEdit: (updatedFlashcard) {
                            deck.flashcards[index] = updatedFlashcard;
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
                    onDeleteFlashcard(deck.flashcards[index]);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Flashcard deleted!')),
                    );
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlashcardScreen(
                    flashcard: deck.flashcards[index],
                    onDelete: () {
                      onDeleteFlashcard(deck.flashcards[index]);
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFlashcardScreen(
                deck: deck,
                onAddFlashcard: (flashcard) {
                  deck.flashcards.add(flashcard);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Flashcard added!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
