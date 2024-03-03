import 'package:flutter/cupertino.dart';

class Services {
  Services({
    String? appointment,
    String? experience,
    String? imageUrl2,
    String? name,
    String? id,
    String? imageUrl,
    String? phone,
    String? type,
  }) {
    _appointment = appointment;
    _experience = experience;
    _imageUrl2 = imageUrl2;
    _name = name;
    _id = id;
    _imageUrl = imageUrl;
    _phone = phone;
    _type = type;
  }

  Services.fromJson(dynamic json) {
    _appointment = json['appointment'];
   _experience= json['experience'];
    _imageUrl2 = json['imageUrl2'];
    _name = json['name'];
    _id = json['id'];
    _imageUrl = json['imageUrl'];
    _phone = json['phone'];
    _type = json['type'];
  }

  String? _appointment;
  String? _experience;
  String? _imageUrl2;
  String? _name;
  String? _id;
  String? _imageUrl;
  String? _phone;
  String? _type;

  String? get appointment => _appointment;
  String? get experience => _experience;
  String? get imageUrl2 => _imageUrl2;
  String? get name => _name;
  String? get id => _id;
  String? get imageUrl => _imageUrl;
  String? get phone => _phone;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appointment'] = _appointment;
    map['experience'] = _experience;
    map['imageUrl2'] = _imageUrl2;
    map['name'] = _name;
    map['id'] = _id;
    map['imageUrl'] = _imageUrl;
    map['phone'] = _phone;
    map['type'] = _type;

    return map;
  }
}