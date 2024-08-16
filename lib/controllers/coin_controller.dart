import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mock_ronas_it/models/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController {
  RxList<Coin> coins = <Coin>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  final box = GetStorage();

  List<Coin> get favouriteCoins {
    return coins.where((coin) => coin.isFavourite.value).toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
    loadFavouriteCoins();
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
          loadFavouriteCoins();
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

  void toggleFavourite(Coin coin) {
    coin.isFavourite.value = !coin.isFavourite.value;
    saveFavouriteCoins();
  }

  void loadFavouriteCoins() {
    List<dynamic> favouriteIds =
        box.read<List<dynamic>>('favouriteCoins') ?? [];
    for (var coin in coins) {
      coin.isFavourite.value = favouriteIds.contains(coin.id);
    }
  }

  void saveFavouriteCoins() {
    List<String> favouriteIds = coins
        .where((coin) => coin.isFavourite.value)
        .map((coin) => coin.id)
        .toList();
    box.write('favouriteCoins', favouriteIds);
  }
}
