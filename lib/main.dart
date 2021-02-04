import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
      items:List<ListItem>.generate(
          1000, (i) => i%6==0
          ? HeadingItem()
          : MessageItem()
      )
  )
  );
}

class MyApp extends StatelessWidget{
  final List<ListItem> items;
  MyApp({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'NoteBookApp',
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.pinkAccent,title: Text('Note List'),),
          body: ListView.builder(itemCount: items.length,
              itemBuilder: (context, i)
              {
                final item = items[i];
                return ListTile(title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),);
              }
          ),
        )
    );
  }
}


abstract class ListItem{
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}
class HeadingItem implements ListItem {
  Widget buildTitle(BuildContext context) {
    TextEditingController controller = TextEditingController();
    //String value = "";
    return TextField(decoration: InputDecoration(
      border: InputBorder.none,hintText: 'Enter your heading',
      labelText: 'Heading', labelStyle: TextStyle(
        color: Colors.blueGrey,
        fontStyle: FontStyle.italic,fontSize: 15.0
    ),
    ),
      controller: controller,
      onChanged: (text)
      {
        print("$text");
      },
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}
class MessageItem implements ListItem {
  Widget buildTitle(BuildContext context)
  {
    TextEditingController controller = TextEditingController();
    //String value = "";
    return TextField(decoration: InputDecoration(
        border: InputBorder.none,hintText: 'Enter date that\'s you enter'
    ),controller: controller,
        onChanged: (text)
        {
          print("$text");
        }
    );
  }
  Widget buildSubtitle(BuildContext context)
  {
    TextEditingController controller = TextEditingController();
    //String value = "";
    return TextField(decoration: InputDecoration(
        border: InputBorder.none,hintText: 'Enter your note'
    ),
        controller: controller,
        onChanged: (text)
        {
          print("$text");
        }
    );
  }
}