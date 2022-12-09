import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpodAPP/web_servis.dart';

import 'inc_counter.dart';

final helloText = Provider((ref) => "HelloWord");
final counterProvider = ChangeNotifierProvider((ref) => IncrementCounter());

final httpClient = Provider((ref) => WebService());
final responseProvider = FutureProvider((ref) async {
  final http = ref.watch<WebService>(httpClient);
  return http.fakeHttpData();
});

final getDataProvider =
    FutureProvider.family<ResponseModel, String>((ref, apiUrl) async {
  var client = ref.read(httpClient);
  ResponseModel resultData = await client.getData(apiUrl) as ResponseModel;
  return resultData;
});
