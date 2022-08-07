import '../question/question.dart';
import '../question/answer.dart';

class DataRepository {
  static final DataRepository _instance = DataRepository._();

  factory DataRepository() {
    return _instance;
  }

  DataRepository._();

  Future<List<Question>> fetchQuestions() async {
    await Future.delayed(const Duration(milliseconds: 900));
    return _demoQuestions.toList();
  }

  Set<Question> get _demoQuestions => <Question>{
        Question(
            id: "9qe9ahsd08fhasßdfjas",
            title: "How many balls is a game of Quidditch played with?",
            explanation: "There is one quaffel, three bludgers and one snitch.",
            answers: <Answer>[
              Answer(id: "0a8hertihansd", text: "4", isCorrect: false),
              Answer(id: "u98qmtuma0s8dz", text: "5", isCorrect: true),
              Answer(id: "a9hfsd981ahsbdf", text: "7", isCorrect: false),
              Answer(id: "1zf28zevas", text: "2", isCorrect: false),
            ]),
        Question(
            id: "a0sdhfg0agh290eurbasd",
            title: "When and where was the real life sport founded?",
            explanation:
                "The sport was brought to life in 2005 at Middlebury College in Middlebury, Vermont, by Xander Manshel and Alex Benepe.",
            answers: <Answer>[
              Answer(
                  id: "082z4rhouahdsf",
                  text: "In 2005 at Middlebury College in Vermont, USA.",
                  isCorrect: true),
              Answer(
                  id: "oghq3o4tubfausd",
                  text: "In 2008 at the University of Birmingham in the UK.",
                  isCorrect: false),
              Answer(
                  id: "71g9a7ubsdfasd",
                  text: "At the 2012 Falkon Festival for Fantasy Lovers.",
                  isCorrect: false),
              Answer(
                  id: "08wzrht0ahsbdouf",
                  text:
                      "At Harry Potter's birthplace, Surrey, UK, with an unknown date.",
                  isCorrect: false),
            ]),
        Question(
            id: "a9sgdhv9g23br9aisubd",
            title:
                "Which teams played in the World Cup final of 2016 in Frankfurt, Germany?",
            explanation: null,
            answers: <Answer>[
              Answer(
                  id: "0a9sd0hiasdqribasd",
                  text: "Germany - France, for a score of 130 to 70*.",
                  isCorrect: false),
              Answer(
                  id: "0a8zshdf0ahsj2e",
                  text:
                      "Australia - United States, for a score of 150* to 130.",
                  isCorrect: true),
              Answer(
                  id: "a0jsdoiha2eafsd",
                  text: "United States - Belgium, for a score of 120* to 70.",
                  isCorrect: false),
              Answer(
                  id: "akbsofvh24r0ohasd",
                  text: "United Kingdom - Canada, for a score of 140 to 210*.",
                  isCorrect: false),
            ]),
        Question(
            id: "aisvbdv9gw30ruahsd",
            title:
                "How do players substitute the use of flying broomsticks in the real sport?",
            explanation:
                "There is a handicap in every sport: in soccer, you cannot use your arms, in basketball, you have to dribble, and in Quidditch, you have to hold a stick between your legs while playing. This makes it harder to run while catching balls and tackling players, therefore being an essential part of the sport.\n\nIn some parts of the world, the broom is substituted with a bicycle, but it is far from being common.",
            answers: <Answer>[
              Answer(
                  id: "ohasgdf89h1308",
                  text: "Players ride bicycles instead of brooms.",
                  isCorrect: false),
              Answer(
                  id: "uahg9dfsuhfasdf",
                  text:
                      "The game is played with iron sticks on an antimagnetic force field, lifting players up.",
                  isCorrect: true),
              Answer(
                  id: "a9hfsd981ahsbdf",
                  text:
                      "Players guide a plastic stick between their legs, but run on their legs otherwise.",
                  isCorrect: true),
              Answer(
                  id: "1zf28zevas3rasd",
                  text: "Brooms were removed without a substitution.",
                  isCorrect: false),
            ]),
        Question(
            id: "biasdbviaj9egf924gfasd",
            title:
                "How is the magically flying golden snitch implemented in real life?",
            explanation:
                "The snitch is a tennis ball placed at the bottom of a long yellow pouch that is attached to the back of the snitch runner's shorts as if it were a tail. The snitch runner may do everything in their power to protect the snitch from being caught by seekers, for example pushing, running, or even throwing the player's broom away.",
            answers: <Answer>[
              Answer(
                  id: "a9shd0ahsdofbqerj",
                  text:
                      "The snitch is a tennis ball in a sock, attached to the back of the impartial snitch runner.",
                  isCorrect: true),
              Answer(
                  id: "a0sdh0ahwijbwda",
                  text: "A golden drone flies through the field occasionally.",
                  isCorrect: false),
              Answer(
                  id: "asghd9vuo23ras",
                  text:
                      "A bouncy ball is thrown through the field and needs to be caught in midair.",
                  isCorrect: false),
              Answer(
                  id: "08ausd0fhawe",
                  text:
                      "Since magic is not real, there is no implementation of the snitch.",
                  isCorrect: false),
            ]),
      };
}
