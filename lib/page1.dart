import 'package:flutter/material.dart';
import 'graphql.dart';

class Page1 extends StatefulWidget {
  int codeId;

  Page1(this.codeId, {Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  var query;
  var data;
  var isLoading = true;

  @override
  void initState() {
    query = """
    {
        #직종별, 업종별 카테고리 목록별 리스트 출력
        jobCategoryList(codeId: ${widget.codeId}){
            id
            name
        }
    }
    """;
    Graphql().query(query).then((result) {
      data = result;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('###33#####');
    print(data);
    return Container();
  }
}
