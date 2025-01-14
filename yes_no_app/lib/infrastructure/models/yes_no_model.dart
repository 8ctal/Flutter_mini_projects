import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  bool forced;
  String image;
  String answer;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  factory YesNoModel.fromJson(Map<String, dynamic> json) {
    return YesNoModel(
      answer: json['answer'],
      forced: json['forced'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() => {
        'answer': answer,
        'forced': forced,
        'image': image,
      };

  Message toMessageEntity() => Message(
        fromWho: FromWho.hers,
        text: answer == 'yes' ? 'Yes' : 'No',
        imageURL: image,
      );
}
