

import 'package:covid19app/model_data/case_indonesia.dart';
import 'package:covid19app/network/network_provider.dart';

class NetworkRepository{
  final _provider = NetworkProvider();
  Future<List<CaseIndonesia>> fetchData() => _provider.getCase();
}