import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget{
	@override
	RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final wordPairs = <WordPair>[];
  final savedWordPairs = Set<WordPair>();

	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[IconButton(
          icon: Icon(Icons.list), onPressed: pushSaved,
        )],
      ),
      body: buildList()
    );
  }

  Widget buildList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item){
        if(item.isOdd) return Divider(); //return a divider for every odd index
        final index = item ~/2; //calculate num of views in listview minus the dividers
        if(index >= wordPairs.length){
          wordPairs.addAll(generateWordPairs().take(10));
        }
        return buildRow(wordPairs[index]);
      }
    );
  }

  Widget buildRow(WordPair pair){
    final alreadySaved = savedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null),
      onTap: (){
        setState(() {
          if(alreadySaved){
            savedWordPairs.remove(pair);
          }else{
            savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  void pushSaved(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context){
        final Iterable<ListTile> tiles = savedWordPairs.map((WordPair pair){
          return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0))
          );
        });
        final List<Widget> divided = ListTile.divideTiles(context: context, tiles: tiles).toList();
        return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided)
        );
      }
    ));
  }

}