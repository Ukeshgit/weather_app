class FamousCitiesModel {
  String name;
  double lat;
  double lon;
  FamousCitiesModel({required this.name, required this.lat, required this.lon});
}

List<FamousCitiesModel> famousCitiesList = [
  FamousCitiesModel(name: 'New York', lat: 40.7128, lon: -74.0060),
  FamousCitiesModel(name: 'London', lat: 51.5074, lon: -0.1278),
  FamousCitiesModel(name: 'Paris', lat: 48.8566, lon: 2.3522),
  FamousCitiesModel(name: 'Tokyo', lat: 35.6895, lon: 139.6917),
  FamousCitiesModel(name: 'Sydney', lat: -33.8688, lon: 151.2093),
  FamousCitiesModel(name: 'Beijing', lat: 39.9042, lon: 116.4074),
  FamousCitiesModel(name: 'Rome', lat: 41.9028, lon: 12.4964),
  FamousCitiesModel(name: 'Moscow', lat: 55.7558, lon: 37.6176),
];
