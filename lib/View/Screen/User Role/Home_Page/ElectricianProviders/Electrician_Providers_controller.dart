import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../service/api_url.dart';
import '../models/provider_model.dart';

class ProviderApi {
  static Future<List<ProviderModel>> fetchProviders() async {
    final res = await http.get(Uri.parse(ApiUrls.providerList));

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      return data.map((e) => ProviderModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
