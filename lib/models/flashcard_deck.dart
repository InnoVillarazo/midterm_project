import 'flashcard.dart';

class FlashcardDeck {
  final String title;
  List<Flashcard> flashcards;

  FlashcardDeck({required this.title, List<Flashcard>? flashcards})
      : this.flashcards = flashcards ?? [];
}
