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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '85B45B26-CD56-476E-87A9-B05823FDE950';
const url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';

class CoinData {
  NetworkHelper networkHelper = NetworkHelper(url: '$url?apikey=$apiKey');

  Future<dynamic> getCoinData() async {
    return await networkHelper.getData();
  }
}
