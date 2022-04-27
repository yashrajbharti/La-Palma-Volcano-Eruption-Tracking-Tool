class Point {
  double lat;
  double lng;

  Point(this.lat, this.lng);

  generateTag() {
    return '''
      <Point>
        <gx:drawOrder>1</gx:drawOrder>
        <coordinates>${this.lng},${this.lat}</coordinates>
      </Point>
    ''';
  }

  toMap() {
    return {
      "lat": lat,
      "lng": lng,
    };
  }

  static fromMap(dynamic map) {
    return Point(map['lat'], map['lng']);
  }

  @override
  String toString() {
    return super.toString();
  }
}
