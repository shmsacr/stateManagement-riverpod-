import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  Future<String> fakeHttpData(
      [String url =
          "https://stackoverflow.com/questions/71871096/pub-get-failed-a-package-may-not-list-itself-as-a-dependency"]) async {
    await Future.delayed(const Duration(seconds: 2));
    return "Response from $url";
  }

  Future<IResponseModel<R>> getData<R extends dynamic>(
      [String url = "https://jsonplaceholder.com/users"]) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        var result = jsonData as R;
        return ResponseModel(result);
      } else if (jsonData is Map<String, dynamic>) {
        return ResponseModel(jsonData as R);
      } else {
        return jsonData;
      }
    }
    return ResponseModel("Empty Data" as R);
  }
}

abstract class IResponseModel<T> {
  final T data;
  IResponseModel(this.data);
}

class ResponseModel<T extends dynamic> extends IResponseModel<T> {
  ResponseModel(this.getData) : super(getData);
  final T getData;
}
