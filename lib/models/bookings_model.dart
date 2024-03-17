
class Bookings {
  Bookings({
    String? id,
    String? date,
    String? name,
    String? type,
    String? doctorName,
    String? phoneNumber,
  }) {
    _id = id;
    _date = date;
    _name = name;
    _type = type;
    _doctorName = doctorName;
    _phoneNumber = phoneNumber;

  }

  Bookings.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _name = json['name'];
    _type = json['type'];
    _doctorName = json['doctorName'];
    _phoneNumber = json['phoneNumber'];
  }

  String? _id;
  String? _date;
  String? _name;
  String? _type;
  String? _doctorName;
  String? _phoneNumber;

  String? get id => _id;
  String? get date => _date;
  String? get name => _name;
  String? get type => _type;
  String? get doctorName => _doctorName;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['name'] = _name;
    map['type'] = _type;
    map['doctorName'] = _doctorName;
    map['phoneNumber'] = _phoneNumber;

    return map;
  }
}