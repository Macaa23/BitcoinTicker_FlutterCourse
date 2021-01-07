import 'package:bitcoin_ticker/NetworkHelper';

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
const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/';

class CoinData {
  final requiredCurrency;
  CoinData({this.requiredCurrency});

  Future<dynamic> getCoinData() async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$url$requiredCurrency?apikey=$apiKey');
    return await networkHelper.getData();
  }
}
