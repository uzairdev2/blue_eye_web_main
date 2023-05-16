import 'package:blue_eye_web/Screens/Routes%20Screen/model.dart';
import 'package:flutter/foundation.dart';

class RoutesProvider with ChangeNotifier {
  String _selectedCity = 'Karachi';
  bool action = false;
  List<DataModalRoute> _filteredRoutes =
      routeDataModelList.first['Karachi'] ?? [];

  String get selectedCity => _selectedCity;
  List<DataModalRoute> get filteredRoutes => _filteredRoutes;

  void setSelectedCity(String city) {
    _selectedCity = city;
    _filteredRoutes = routeDataModelList.first[city] ?? [];
    notifyListeners();
  }

  ///Hondling Hover Effect

  final Map<int, bool> _hoverMap = {};

  bool isHovered(int index) {
    return _hoverMap[index] ?? false;
  }

  void setHover(int index, bool isHovered) {
    _hoverMap[index] = isHovered;
    notifyListeners();
  }

  void updateStatus(int index) {
    final route = _filteredRoutes[index];
    route.status = route.status == 'Available' ? 'Not Available' : 'Available';
    notifyListeners();
  }
}
