import 'dart:async';
import 'package:graphql_client/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';


void main() {
  // future 라는 변수에서 미래에(3초 후에) int가 나올 것입니다



  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static final HttpLink _httpLink = HttpLink("http://192.168.1.24/graphql");

  static ValueNotifier<GraphQLClient> initClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(),
      ),
    );
    return client;
  }

  @override
  Widget build(BuildContext context) {

    return GraphQLProvider(
      client: initClient(),
      child: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    Graphql test = Graphql();
    print('기다리는중');
  /*  test.future.then((val) {
      // int가 나오면 해당 값을 출력
      print('val: $val');
    }).catchError((error) {
      // error가 해당 에러를 출력
      print('error: $error');
    });*/

    print(111);
    var data = test.query();
    // print(data);




    return MaterialApp(
      home: Scaffold(
        body: Text('1'),
      ),
    );
  }
}

