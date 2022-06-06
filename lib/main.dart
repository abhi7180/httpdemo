import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpdemo/mycls.dart';
import 'package:httpdemo/user.dart';

import 'insert.dart';


void  main()
{
  runApp(MaterialApp(home: First(),));

}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {

  List<mycls> list = [];

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
    var url = Uri.parse('https://abhiflutter.000webhostapp.com/get_mydata.php');
    var response = await http.post(url);

    dynamic data = jsonDecode(response.body);

    list.clear();
    data.forEach((e) {
      setState(() {
        list.add(mycls.fromJson(e));
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
          onTap: () async {


          },
          title: Text("${list[index].name}"),
          subtitle: Text("${list[index].contact}"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () async {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return insert(list[index]);
                },));


              }, icon: Icon(Icons.edit,color: Colors.black,)),
              IconButton(onPressed: () async {

                var url = Uri.parse('https://abhiflutter.000webhostapp.com/delete.php?id=${list[index].id}');
                var response = await http.get(url);
                print(response.body);
                if(response.body=="data deleted")
                {
                  getdata();
                }

              }, icon: Icon(Icons.delete,color: Colors.black,)),
            ],
          )
        );
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {



        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        //   return insert(list[]);
        // },));

      },child: Icon(Icons.add),),
    );
  }
}
