// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Users',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   List<User> users = [];

//   Future<List<User>> _getUsers() async {
//     final String response = await rootBundle.loadString('assets/mock-data.json');
//     final jsonData = await json.decode(response);
//     setState(() {
//       users = jsonData["userData"];
//     });



//     for(var u in jsonData){
//       User user = User(u["id"], u["first_name"], u["last_name"], u["username"], u["last_seen_time"], u["avatar"], u["status"]);
//       users.add(user);
//     }

//     print(users.length);

//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container (
//         child: FutureBuilder(
//           future: _getUsers(),
//           builder: (BuildContext context, AsyncSnapshot snapshot){
//             if(snapshot.data == null){
//               return Container(
//                 child: const Center(
//                   child: Text('Loading...')
//                 )
//               );
//             } else {
//               return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index){
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(
//                       snapshot.data[index].avatar
//                     ),
//                   ),
//                   title: Text(snapshot.data[index].first_name),
//                 );
//               }
//               );
//             }
//           },
//           )
//         ),
//     );
//   }
// }

// class User {
//   var id = [];
//   // ignore: non_constant_identifier_names
//   final String first_name;
//   // ignore: non_constant_identifier_names
//   final String last_name;
//   final String username;
//   // ignore: non_constant_identifier_names
//   final String last_seen_time;
//   final String avatar;
//   final String status;

//   User(this.id, this.first_name, this.last_name, this.username, this.last_seen_time, this.avatar, this.status);

// }


// CODE 2

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List _items = [];

//   // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/mock-data.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["userData"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Kindacode.com',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           children: [
//             ElevatedButton(
//               child: const Text('Load Data'),
//               onPressed: readJson,
//             ),

//             // Display the data loaded from sample.json
//             _items.isNotEmpty
//                 ? Expanded(
//                     child: ListView.builder(
//                       itemCount: _items.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           margin: const EdgeInsets.all(10),
//                           child: ListTile(
//                             leading: Text(_items[index]["id"]),
//                             title: Text(_items[index]["first_name"]["last_name"]),
//                             subtitle: Text(_items[index]["status"]),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }