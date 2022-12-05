class WebService {
  Future<String> fakeHttpData(
      {String url =
          "https://stackoverflow.com/questions/71871096/pub-get-failed-a-package-may-not-list-itself-as-a-dependency"}) async {
    await Future.delayed(const Duration(seconds: 2));
    return "Respınse from $url";
  }
}
