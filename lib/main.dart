import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final helloText = Provider((ref) => "HelloWord");
final counterProvider = ChangeNotifierProvider((ref) => IncrementCounter());

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
    final count = ref.watch<IncrementCounter>(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Center(child: Text(count.value.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.incCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class IncrementCounter extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  incCount() {
    _value++;
    notifyListeners();
  }
}
