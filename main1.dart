import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
      items:List<ListItem>.generate(
          1000, (i) => i%6==0
          ? HeadingItem("Heading $i")
          : MessageItem("Name $i", "Message body $i")
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
            body: ListView.builder(itemCount: items.length,
                itemBuilder: (context, i)
                {
                  final item = items[i];
                  return ListTile(title: item.buildTitle(context),
                  subtitle: item.buildSubtitle(context),);
                }
            )
        )
    );
  }
}


abstract class ListItem{
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);

}
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}
class MessageItem implements ListItem {
  final String name;
  final String body;
  MessageItem(this.name, this.body);

  Widget buildTitle(BuildContext context) => Text(name);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
