import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:httpdemo/main.dart';
import 'package:httpdemo/mycls.dart';
class insert extends StatefulWidget {

  mycls list;


  insert(this.list);

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return First();
          },));
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [

          TextField(controller: t1,),
          TextField(controller: t2,),

          ElevatedButton(onPressed: () async {

            String name=t1.text;
            String contact=t2.text;


            var url = Uri.parse('https://abhiflutter.000webhostapp.com/insert.php?n=$name&c=$contact');
            var response = await http.get(url);




            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');


            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return First();
            },));

          }, child: Text("Insert data"))
        ],
      ),
    );
  }
}
