import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
          title: "Currency Converter",
          home: CurrencyConverter(),
          theme: ThemeData(primarySwatch: Colors.red)),
    );

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final fromTextController = TextEditingController();
  List<dynamic> currencies = [];
  String fromCurrency = "EUR";
  String toCurrency = "MAD";
  String result = "Loading...";

//Implementation de l'API Open Rates

  @override
  void initState() {
    super.initState();
    _loadCurrencies();
  }

  Future<String> _loadCurrencies() async {
    String uri =
        "http://api.exchangeratesapi.io/v1/latest?access_key=95fbf58d8206e717ff60efaedcb2ceb7";
    var response = await http.get(Uri.parse(Uri.encodeFull(uri)),
        headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri =
        "http://api.exchangeratesapi.io/v1/latest?access_key=95fbf58d8206e717ff60efaedcb2ceb7";
    var response = await http.get(Uri.parse(Uri.encodeFull(uri)),
        headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    setState(() {
      result = (double.parse(fromTextController.text) *
              (responseBody["rates"][toCurrency]))
          .toString();
    });
    print(result);
    return "Success";
  }

  _onFromChanged(String value) {
    setState(() {
      fromCurrency = value;
    });
  }

  _onToChanged(String value) {
    setState(() {
      toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ConvertIt"),
      ),
      body: currencies == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ListTile(
                        title: TextField(
                          controller: fromTextController,
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                        trailing: _buildDropDownButton(fromCurrency),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_downward),
                        onPressed: _doConversion,
                      ),
                      ListTile(
                        title: Chip(
                          label: result != null
                              ? Text(
                                  result,
                                  style: Theme.of(context).textTheme.button,
                                )
                              : Text(""),
                        ),
                        trailing: _buildDropDownButton(toCurrency),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDropDownButton(String currencyCategory) {
    return DropdownButton(
      value: currencyCategory,
      items: currencies
          .map((dynamic value) => DropdownMenuItem(
                value: value,
                child: Row(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ))
          .toList(),
      onChanged: (dynamic value) {
        if (currencyCategory == fromCurrency) {
          _onFromChanged(value);
        } else {
          _onToChanged(value);
        }
      },
    );
  }

  theme({required ThemeData context}) {}
}
