import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'list_places.dart';
import 'places_search.dart';

class Send {
  final String place;
  final String placeId;

  Send(this.place, this.placeId);
}

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  TextEditingController _searchController = TextEditingController();
  var _placesList = [];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ListPlaces()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Search Location'),
            centerTitle: true,
            backgroundColor: const Color(0xFF05998C),
          ),
          body: Builder(builder: (BuildContext newContext) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              //height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          newContext.read<ListPlaces>().searchPlaces(value);
                          _placesList =
                              newContext.read<ListPlaces>().searchResults;
                        });
                      },
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 17.5),
                      )),
                  // SizedBox(height: -30),

                  if (newContext.read<ListPlaces>().searchResults != null)
                    Expanded(child: Consumer<ListPlaces>(
                      builder: (context, listPlaces, _) {
                        final searchResults = listPlaces.searchResults;
                        return ListView.builder(
                            // shrinkWrap: true,
                            itemCount: searchResults.length,
                            //_placesList.length,
                            itemBuilder: (context, index) {
                              final searchResult = searchResults[index];
                              //_placesList[index];
                              //= newContext
                              //     .read<ListPlaces>()
                              //     .searchResults[index];
                              print(searchResult.description);
                              return Material(
                                child: ListTile(
                                  title: Text(searchResult.description
                                      // newContext
                                      //     .read<ListPlaces>()
                                      //     .searchResults[index]
                                      //     .description,
                                      ),
                                  onTap: () async {
                                    print("hello");

                                    final sendData = Send(
                                        searchResult.description,
                                        searchResult.placeId);
                                    _searchController.text =
                                        searchResult.description;

                                    print(sendData.place);
                                    Navigator.pop(context, sendData);
                                  },
                                ),
                              );
                            });
                      },
                    ))
                ],
              ),
            );
          })),
    );
  }
}
