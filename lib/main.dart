import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyFirstClass {
  final String myValue = "First Class";
}

class MySecondClass {
  final MyFirstClass firstClass;
  MySecondClass(this.firstClass);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MyFirstClass(),
      child: ProxyProvider<MyFirstClass, MySecondClass>(
        update: (context, firstClass, secondClass) {
          return MySecondClass(firstClass);
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Builder(builder: (context) {
            return Center(
              child: Text(
                Provider.of<MySecondClass>(context).firstClass.myValue,
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
        ),
      ),
    );
  }
}
