import 'package:flutter/material.dart';

void _startSearch(BuildContext context) {
  showSearch(
    context: context,
    delegate: MySearchDelegate(),
  );
}

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search field
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = data
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]); // Return the selected result
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? data
        : data
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context); // Show the search results
          },
        );
      },
    );
  }
}
