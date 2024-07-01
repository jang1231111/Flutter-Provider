class DirectGeocoding {
  final String name;
  final double lat;
  final double lon;
  final String country;

  DirectGeocoding(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.country});

  factory DirectGeocoding.fromJson(List<dynamic> json) {
    final Map<String, dynamic> data = json[0];

    return DirectGeocoding(
        name: data['name'],
        lat: data['lat'],
        lon: data['lon'],
        country: data['country']);
  }

  DirectGeocoding copyWith({
    String? name,
    double? lat,
    double? lon,
    String? country,
  }) {
    return DirectGeocoding(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return 'DirectGeocoding(name: $name, lat: $lat, lon: $lon, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DirectGeocoding &&
        other.name == name &&
        other.lat == lat &&
        other.lon == lon &&
        other.country == country;
  }

  @override
  int get hashCode {
    return name.hashCode ^ lat.hashCode ^ lon.hashCode ^ country.hashCode;
  }
}
