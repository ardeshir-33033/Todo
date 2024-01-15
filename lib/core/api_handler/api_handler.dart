import 'package:dio/dio.dart';
import 'package:todo_list/core/api_handler/response_model.dart';

abstract class ApiHandler {
  static const int _timeout = 20;

  Future<ResponseModel> httpGet(
    String url,
  );
}

class ApiHandlerImpl extends ApiHandler {
  @override
  Future<ResponseModel> httpGet(String url) async {
    var response = await Dio()
        .get(url)
        .timeout(const Duration(seconds: ApiHandler._timeout));
    ResponseModel responseModel =
        ResponseModel().fromJson(response.data);
    return responseModel;
  }
}
