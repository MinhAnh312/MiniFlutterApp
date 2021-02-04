import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  final GlobalKey<NoteList> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Task'),
        backgroundColor: Colors.pink[100],
      ),
      body: NoteListS(
        key: _key,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _displayDialog(context)),
    );
  }
  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
          title: Text('Enter Your Note'),
          content: TextField(
            controller: _textFieldController),
        actions: <Widget>[
          TextButton(
            onPressed: (){Navigator.of(context).pop();},
            child: Text('CANCEL'),
          ),
          TextButton(
            child: Text('ADD'),
            onPressed: () {_key.currentState.setNote(Note(title: _textFieldController.text));
            setState(() {});
            Navigator.of(context).pop();
            },
          )
        ],
      );}
      );
  }
}

class NoteListS extends StatefulWidget{
  NoteListS({Key key}) : super(key: key);
  @override
  NoteList createState() => NoteList();
}
class NoteList extends State<NoteListS>{
  List<Note> notes = [];

  void setNote(Note note) {
    notes.add(note);
  }

  @override
  Widget build(BuildContext context) {
    return myListView(context, notes);
  }
}
class Note{
  String title;

  Note({
    this.title,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
  };
}
Widget myListView(BuildContext context, List<Note> notes) {
  return ListView.builder(
    itemCount: notes.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(notes[index].title),
      );
    },
  );
}