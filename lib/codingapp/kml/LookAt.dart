class LookAt {
  double lng;
  double lat;
  String range;
  String tilt;
  String heading;

  LookAt(this.lng, this.lat, this.range, this.tilt, this.heading);

  generateTag() {
    return '''
       <LookAt>
        <longitude>${this.lng}</longitude>
        <latitude>${this.lat}</latitude>
        <range>${this.range}</range>
        <tilt>${this.tilt}</tilt>
        <heading>${this.heading}</heading>
        <gx:altitudeMode>relativeToGround</gx:altitudeMode>
      </LookAt>
    ''';
  }

  generateLinearString() {
    return '<LookAt><longitude>${this.lng}</longitude><latitude>${this.lat}</latitude><range>${this.range}</range><tilt>${this.tilt}</tilt><heading>${this.heading}</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>';
  }

  toMap() {
    return {
      "lng": lng,
      "lat": lat,
      "range": range,
      "tilt": tilt,
      "heading": heading,
    };
  }

  static fromMap(dynamic map) {
    return LookAt(
        map['lng'], map['lat'], map['range'], map['tilt'], map['heading']);
  }

  @override
  String toString() {
    return super.toString();
  }
}
