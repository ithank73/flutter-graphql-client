import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

class Graphql{

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


    int test() {
        return 1;
    }

    Future<dynamic> query() async {
        var test = """
        {
            #직종별, 업종별 카테고리 목록별 리스트 출력
            jobCategoryList(codeId: 56){
                id
                name
            }
        }
        """;
        var result = await _client.query(QueryOptions(
            document: gql(test),
        ));

        if (result.hasException) {
            var message = result.exception!.graphqlErrors.first.message;
            throw GraphQLError(message: message);
        }
        print(result.data);
        return result.data;
    }


    Future<dynamic> futureNumber() {
        // 3초 후 100이 상자에서 나옵니다
        return Future<int>.delayed(Duration(seconds: 3), () {
            return 100;
        });
    }

    late Future<dynamic> future;
    late GraphQLClient _client = GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(),
    );

    Graphql(){
        future = futureNumber();
        // _client = GraphQLClient(cache: null);
    }
}