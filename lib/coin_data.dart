import 'package:bitcoin_ticker/NetworkHelper.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'CLP',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '85B45B26-CD56-476E-87A9-B05823FDE950';
const url = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinData {
  final requiredCurrency;
  CoinData({this.requiredCurrency});

  Future getCoinData() async {
    NetworkHelper networkHelper = NetworkHelper();
    List<String> prices = [];
    for (int i = 0; i < cryptoList.length; i++) {
      var price = await networkHelper.getData(
          url: '$url${cryptoList[i]}/$requiredCurrency?apikey=$apiKey');
      prices.add(price['rate'].toStringAsFixed(0));
    }
    return prices;
  }
}
