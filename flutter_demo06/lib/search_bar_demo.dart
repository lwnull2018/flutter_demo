import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({super.key});

  @override
  State<SearchBarDemo> createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchBarDemo'),
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              }, 
              icon: const Icon(Icons.search)
          )
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {

  //清空搜索框内容
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = "",
          icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, ''),
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  //搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSugest
        : searchlist.where((element) => element.startsWith(query)).toList();
    
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index)=> ListTile(
          title: RichText(
            text: TextSpan(
              text:suggestionList[index].substring(0,query.length),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: const TextStyle(color: Colors.grey)
                )
              ]
            ),
          ),
        )
    );
  }

}