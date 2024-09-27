import 'package:flutter/material.dart';
import '../models/flashcard_deck.dart';
import 'deck_screen.dart';
import 'add_deck_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FlashcardDeck> decks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MindCards'),
      ),
      body: ListView.builder(
        itemCount: decks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(decks[index].title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  decks.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Deck deleted!')),
                );
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeckScreen(
                      deck: decks[index],
                      onDeleteFlashcard: (flashcard) {
                        setState(() {
                          decks[index].flashcards.remove(flashcard);
                        });
                      }),
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
              builder: (context) => AddDeckScreen(onAddDeck: (newDeck) {
                setState(() {
                  decks.add(newDeck);
                });
              }),
            ),
          );
        },
      ),
    );
  }
}
