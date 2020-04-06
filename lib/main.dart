
import 'package:flutter/material.dart';
import './words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
	@override
	Widget build(BuildContext context) {

	return MaterialApp(
		theme: ThemeData(primaryColor: Colors.blue[700]),
    home: RandomWords()
		// home: Scaffold(
    //   appBar: AppBar(
    //     title: Text('Word Pair Generator')
    //   ),
    //   body: Center(child: Text(wordPair.asPascalCase))
    //   )
    );
	}
}

