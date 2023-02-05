class Question {
  final String text;
  final bool answer;
  const Question({
    required this.text,
    required this.answer,
  });
}

const List<Question> questions = [
  Question(text: "Is a hotdog a sandwich?", answer: true),
  Question(text: "Can a kangaroo jump higher than a house?", answer: true),
  Question(text: "Is the moon made of cheese?", answer: false),
  Question(text: "Do fish sleep?", answer: true),
  Question(text: "Can a penguin fly?", answer: false),
  Question(text: "Do chickens have dreams?", answer: true),
  Question(text: "Is a tomato a fruit ?", answer: true),
  Question(text: "Can a snake climb a tree?", answer: true),
  Question(text: "Is a giraffe's tongue always blue?", answer: false),
  Question(text: "Do elephants jump?", answer: false),
];
