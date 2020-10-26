import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_weather_app/core/cities.dart';
import 'package:flutter_weather_app/core/next_screen.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedCity;
  List<String> items = ['Moscow'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Add City', style: Theme.of(context).textTheme.bodyText1),
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            back(context);
          },
          icon: Icon(
            CupertinoIcons.arrow_up,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey[300], width: 2)),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: TypeAheadFormField(
                  hideSuggestionsOnKeyboardHide: true,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _typeAheadController,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 2),
                        suffix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  if (!items
                                      .contains(_typeAheadController.text))
                                    items.add(_typeAheadController.text);
                                });
                              },
                              icon: Icon(CupertinoIcons.add)),
                        ),
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'Search',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontSize: 20,
                                )),
                  ),
                  noItemsFoundBuilder: (context) => null,
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      elevation: 1,
                      color: Colors.grey[50],
                      offsetX: -10,
                      hasScrollbar: false,
                      borderRadius: BorderRadius.circular(20)),
                  suggestionsCallback: (pattern) {
                    return CitiesService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (suggestion) {
                    this._typeAheadController.text = suggestion;
                  },
                  validator: (value) =>
                      value.isEmpty ? 'Please select a city' : null,
                  onSaved: (value) => this._selectedCity = value,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: items.length,
                itemExtent: 78,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Colors.grey[300], width: 2)),
                      child: ListTile(
                        title: Text(
                          items[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 25),
                        ),
                        trailing: Icon(Icons.remove_circle_outline),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
