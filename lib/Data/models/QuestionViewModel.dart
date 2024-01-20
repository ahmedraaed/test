
import '../../custom_model/RateModel.dart';
import 'AnswerModel.dart';
import 'QuestionModel.dart';

class QuestionViewModel {
  QuestionModel questionModel;
  List<RateModel>? answer;
  List<AnswerModel>? yesNoAnswers;
  String note;
  AnswerModel selectedAnswer=AnswerModel();

  QuestionViewModel(this.questionModel,
      {this.answer, this.note = "", this.yesNoAnswers});
}
