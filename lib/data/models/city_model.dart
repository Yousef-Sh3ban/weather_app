class CityData {
    CityData({
        required this.id,
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.url,
    });

    final int? id;
    final String? name;
    final String? region;
    final String? country;
    final double? lat;
    final double? lon;
    final String? url;

    factory CityData.fromJson(Map<String, dynamic> json){ 
        return CityData(
            id: json["id"],
            name: json["name"],
            region: json["region"],
            country: json["country"],
            lat: json["lat"],
            lon: json["lon"],
            url: json["url"],
        );
    }

}
