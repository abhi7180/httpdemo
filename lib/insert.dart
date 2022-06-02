import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class insert extends StatefulWidget {
  const insert({Key? key}) : super(key: key);

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

          TextField(controller: t1,),
          TextField(controller: t2,),

          ElevatedButton(onPressed: () async {

            String name=t1.text;
            String contact=t2.text;

            //get
            // var url = Uri.parse('https://abhiflutter.000webhostapp.com/insert.php?n=$name&c=$contact');
            // var response = await http.get(url);


            //post
            var url = Uri.parse('https://abhiflutter.000webhostapp.com/insert.php');
            var response = await http.post(url,body: {'n':"$name",'c':contact});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

          }, child: Text("Insert data"))
        ],
      ),
    );
  }
}
