import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodAPP/riverpod_manager.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final count = ref.watch<IncrementCounter>(counterProvider);
    final getData = ref
        .watch(getDataProvider("https://jsonplaceholder.typicode.com/users"));
    try {
      debugPrint("${getData.value?.data.toString()})");
    } catch (e) {
      debugPrint("Error:${e.toString()}");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}
