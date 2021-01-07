import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String price = '';

  void updateUI() async {
    var coinData =
        await CoinData(requiredCurrency: selectedCurrency).getCoinData();
    setState(() {
      price = coinData['rate'].toStringAsFixed(0);
    });
  }

  DropdownButton getDropdownButton() {
    List<DropdownMenuItem<String>> currencyMenuList = [];
    for (String currency in currenciesList) {
      var menuItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      currencyMenuList.add(menuItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: currencyMenuList,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updateUI();
        });
      },
    );
  }

  CupertinoPicker getCupertinoPicker() {
    List<Text> currencyMenuList = [];
    for (String currency in currenciesList) {
      var menuItem = Text(
        currency,
        style: TextStyle(color: Colors.white),
      );
      currencyMenuList.add(menuItem);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (elementIndex) {
        setState(() {
          selectedCurrency = currenciesList[elementIndex];
          updateUI();
        });
      },
      children: currencyMenuList,
    );
  }

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $price $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child:
                Platform.isAndroid ? getDropdownButton() : getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}
