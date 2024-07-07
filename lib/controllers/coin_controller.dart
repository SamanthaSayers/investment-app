import 'package:get/get.dart';
import 'package:mock_ronas_it/models/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxList<Coin> coins = <Coin>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }

  fetchCoins() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=true'));

      if (response.statusCode == 200) {
        List<Coin> coinsList = coinFromJson(response.body);
        if (coinsList.isEmpty) {
          errorMessage.value = 'No data available';
        } else {
          coins.value = coinsList;
        }
      } else {
        errorMessage.value = 'Failed to fetch data';
      }
    } catch (e) {
      errorMessage.value = 'An error occurred: $e';
    } finally {
      isLoading(false);
    }
  }
}
