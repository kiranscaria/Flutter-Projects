import 'package:flutter/material.dart';

import 'networking.dart';

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

const String bitcoinAverageUrl =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future<dynamic> getCoinData({@required String currency}) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = bitcoinAverageUrl + crypto + currency;
      NetworkHelper networkHelper = NetworkHelper(url: requestURL);

      var decodedData = await networkHelper.getData();
      double lastPrice = decodedData['last'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);

      print('url: $requestURL, dict: $cryptoPrices');
    }
    return cryptoPrices;
  }
}
