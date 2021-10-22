import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:thienfire/screens/search_screen/result_search_screen.dart';
import 'package:thienfire/temp/fake_data.dart';

class FirstSearchScreen extends StatefulWidget {
  @override
  _FirstSearchScreenState createState() => _FirstSearchScreenState();
}

List<String> histories = <String>[];

class _FirstSearchScreenState extends State<FirstSearchScreen> {
  bool isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FAKE_HISTORY.forEach((element) {
      histories.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocus = hasFocus;
            });
          },
          child: SearchTextField(),
        ),
        isFocus
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recent"),
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 300.0,
                    child: histories.length > 0
                        ? ListView.builder(
                            itemCount:
                                histories.length >= 5 ? 5 : histories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print("search with: ${histories[index]}");
                                },
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 5.0),
                                    child: Text(
                                      histories[index],
                                      style: TextStyle(fontSize: 18.0),
                                    )),
                              );
                            })
                        : null,
                  )
                ],
              )
            : SizedBox(),
      ],
    );
  }
}

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();

  bool isSearch = false;
  bool isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocus = hasFocus;
          });
        },
        child: TextField(
          onSubmitted: (text) {
            setState(() {
              if (text.trim().length > 0) {
                histories.insert(0, text);
                Navigator.of(context)
                    .pushNamed(ResultSearchScreen.id, arguments: text);
              }
              searchController.clear();
              isSearch = false;
            });
          },
          controller: searchController,
          onChanged: (text) {
            setState(() {
              text.length > 0 ? isSearch = true : isSearch = false;
            });
          },
          decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.red, width: 5.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: isSearch
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.clear();
                          isSearch = false;
                        });
                      },
                      child: Icon(Icons.clear),
                    )
                  : null),
        ),
      ),
    );
  }
}
