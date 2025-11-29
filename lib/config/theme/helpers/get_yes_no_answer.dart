import "package:dio/dio.dart";
import "package:yes_or_no/domain/entities/message.dart";
import "package:yes_or_no/infractructure/models/yes_no_model.dart";

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonmap(response.data);

    return yesNoModel.toMessageEntity();
  }
}

