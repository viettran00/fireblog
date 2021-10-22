import 'package:flutter/material.dart';

class ResultSearchScreen extends StatefulWidget {
  static const String id = "result_search_screen";

  @override
  _ResultSearchScreenState createState() => _ResultSearchScreenState();
}

class _ResultSearchScreenState extends State<ResultSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)!.settings.arguments;
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Icon(Icons.arrow_back),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text("Result for: ${search.toString()}"),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                      Container(
                        height: 50.0,
                        child: TabBar(
                          labelColor: Colors.red,
                          indicatorColor: Colors.red,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'All'),
                            Tab(text: 'Topic'),
                            Tab(text: 'People'),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height - 100.0 - topPadding - bottomPadding, //height of TabBarView
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                          ),
                          child: TabBarView(children: <Widget>[
                            Container(
                              child: Center(
                                child: Text('All result', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('Topic Result', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text('People Result', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ])
                      )
                    ])
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}



