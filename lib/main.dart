import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpdemo/user.dart';

import 'insert.dart';


void  main()
{
  runApp(MaterialApp(home: insert(),));

}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {

  List<User> list = [];

  getdata()
  // try {
  //   var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
  //   print(response);
  //
  //   dynamic data=response.data;
  //
  //   data.forEach((d){
  //     setState(() {
  //       l.add(user.fromJson(d));
  //     });
  //
  //   });
  // } catch (e) {
  //   print(e);
  // }

  async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    dynamic data = jsonDecode(response.body);

    data.forEach((e) {
      setState(() {
        list.add(User.fromJson(e));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text("${list[index].title}"),
          subtitle: Text("${list[index].body}"),
        );
      },),
    );
  }
}
