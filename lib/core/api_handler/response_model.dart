class ResponseModel {
  int statusCode;
  String? message;
  dynamic data;

  ResponseModel({
    this.statusCode = 555,
    this.message,
    this.data,
  });

  ResponseModel fromJson(dynamic json) {
    statusCode = json["code"];
    data = json["data"];
    message = json["errorMessage"] ?? [];

    return this;
  }
}
