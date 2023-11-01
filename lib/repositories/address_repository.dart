
import 'package:active_ecommerce_seller_app/app_config.dart';
import 'package:active_ecommerce_seller_app/data_model/country_response.dart';
import 'package:http/http.dart' as http;
class AddressRepository {

  Future<CountryResponse> getCountryList() async {
    Uri url = Uri.parse("${AppConfig.BASE_URL}/countries");
    final response = await http.get(url);


    return countryResponseFromJson(response.body);
  }

}
