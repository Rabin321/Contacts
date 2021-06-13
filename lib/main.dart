import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contacts",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var contactlist = ["Ram thapa", "Hari sharma", "Rita lama", "Sita hamal"];
  var phno = ["980003844", "9812345567", "9800009878", "976788890"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Contacts",
          style: TextStyle(
              fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: contactlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contactlist[index]),
              subtitle: Text(phno[index]),
              leading: Icon(
                Icons.people_outline_outlined,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    launch(" tel://${phno[index]}");
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  title: Text("Add Contacts"),
                  content: TextField(
                    onChanged: (String value) {},
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
