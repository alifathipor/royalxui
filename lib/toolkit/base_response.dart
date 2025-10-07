class BaseResponse {
  BaseResponse({
    this.isSuccess,
    this.message,
    this.value,
  });

  bool? isSuccess;
  String? message;
  dynamic value;

  BaseResponse.fromJson(dynamic json) {
    isSuccess = json['IsSuccess'];
    message = json['Message'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccess'] = isSuccess;
    map['Message'] = message;
    map['Value'] = value;
    return map;
  }
}
