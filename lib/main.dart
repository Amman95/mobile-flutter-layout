import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:layout/user-data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BSquareBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context,data){
          if(data.hasError){
            return Center (child: Text("${data.error}"));
          } else if(data.hasData){
            var items = data.data as List<UserData>;
            return ListView.builder(
              itemCount: items == null? 0:items.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container (
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          width: 50,
                          height: 50,
                          child: Image(image: NetworkImage(items[index].avatar.toString()),fit: BoxFit.fill,),
                        ),

                        Expanded(child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8, right: 8, bottom: 8), child: Text(
                                '${items[index].first_name.toString()} ${items[index].last_name.toString()}'
                                , style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8, bottom: 8), child: Text(
                              (items[index].first_name.toString())
                              , style: TextStyle(
                              fontSize: 16,
                              ),),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].status.toString()),)
                            ],
                          ),
                        ),),

                        Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 0, right: 0, bottom: 15), child: Text(items[index].last_seen_time.toString()),),
                              CircleAvatar(
                                backgroundColor: Colors.lightBlue,
                                radius: 17,
                                child: Text(items[index].messages?.toString() ?? '0', style: TextStyle(color: Colors.white),),
                        ),
                            ],
                          )
                        ),

                      ]),          
                  ),
                );
              }
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }

  Future<List<UserData>>ReadJsonData() async{
    final jsondata = await rootBundle.rootBundle.loadString('assets/mock-data.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => UserData.fromJson(e)).toList();
  }
}