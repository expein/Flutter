import 'package:dio/dio.dart';
import 'package:mi_chat/domain/entities/message.dart';
import 'package:mi_chat/infrastructure/models/yes_no_models.dart';

class GetYesNoAnswer{

  final _dio = Dio(BaseOptions(

  ));

  Future<Message> getAnswer() async {

    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

  }
}