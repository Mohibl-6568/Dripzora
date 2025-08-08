import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UserStructure {
  Uuid? guestID;
  Image? profileImage;
  String? username;
  String? address;
  String? phoneNumber;
  String? email;
  List<String>? orders;

  UserStructure() {
    guestID = Uuid();
    profileImage = const Image(
      image: AssetImage('assets/images/Default-icon.jpg'),
    );
    orders = [];
  }
}
