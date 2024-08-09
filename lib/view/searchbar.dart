import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchingBar> {
  final SearchController _searchController = SearchController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _textEditingController,
      //elevation: MaterialStateProperty.all(10.0),
      constraints: const BoxConstraints(
          //maxWidth: 300,
          ),
      //side: MaterialStateProperty.all(
      //    BorderSide(color: Colors.pinkAccent.shade100)),
      // shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      //   // side: BorderSide(color: Colors.pinkAccent),
      // )),
      //overlayColor: MaterialStateProperty.all(Colors.pinkAccent),
      //shadowColor: MaterialStateProperty.all(Colors.pinkAccent),
      //backgroundColor:
      //    MaterialStateProperty.all(const Color.fromARGB(255, 238, 228, 182)),
      hintText: 'جستجو...',
      //hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
      //textStyle: MaterialStateProperty.all(
      //  const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
      onChanged: (String value) {
        print('value: $value');
      },
      onTap: () {
        print('tapped');
        // The code below only works with SearchAnchor
        // _searchController.openView();
      },
      onSubmitted: (term) {
        print('submitted: ${_textEditingController.value.text}');
      },
      leading: const Icon(Icons.search),
      trailing: [
        IconButton(
          icon: const Icon(Icons.keyboard_voice),
          onPressed: () {
            print('Use voice command');
          },
        ),
        IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {
            print('Use image search');
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
}
