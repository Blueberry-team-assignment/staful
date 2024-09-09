import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staful/utils/app_styles.dart';
import 'package:staful/widgets/simple_text_input_widget.dart';
import 'package:staful/widgets/staff_profile_widget.dart';
import 'package:staful/widgets/submit_button_widget.dart';
import '../widgets/show_search_widget.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchInputController = TextEditingController();

    void onSearchInputChanged(text) {
      print(text);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "직원",
              style: TextStyleConfig(size: 24).setTextStyle(),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => {
                print("kkkkk"),
                _startSearch(context),
              },
              child: SimpleTextInputWidget(
                placeHolder: "이름으로 검색하세요",
                onChanged: onSearchInputChanged,
                controller: searchInputController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SubmitButtonWidget(
              text: "직원 등록",
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [Text("총 n명")],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      const StaffProfileWidget(imageName: "Ellipse 5.png"),
                      Text(
                        "매니저",
                        style: TextStyleConfig(size: 16).setTextStyle(),
                      )
                    ],
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () => {},
                          child: const Text("일"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("월"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("화"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("수"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("목"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("금"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: const Text("토"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
