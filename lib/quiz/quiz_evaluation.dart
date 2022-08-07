///Returns a string depending on [fractionCorrect], the percentage of correct quiz answers.
///
///Throws an [ArgumentError] if [fractionCorrect] is outside of the 0,1 range.
String getEvaluationMessage(double fractionCorrect) {
  if (fractionCorrect > 1.0 || fractionCorrect < 0.0) {
    throw ArgumentError();
  }
  if (fractionCorrect <= 0.3) {
    return "There is a lot to learn about Quidditch! Check your errors and try again.";
  } else if (fractionCorrect <= 0.5) {
    return "You know a bit about Quidditch already. Take the quiz a few more times to deepen your knowledge.";
  } else if (fractionCorrect <= 0.8) {
    return "Well done! You're on a good path to become a Quidditch expert.";
  } else if (fractionCorrect <= 1.0) {
    return "Fantastic, you caught the golden snitch! You are a Quidditch trivia master.";
  }
  //to silence the compiler.
  return "";
}
