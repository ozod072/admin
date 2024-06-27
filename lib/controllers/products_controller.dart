import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier {
  String _name = '';
  String _imageUrl = 'https://i.pinimg.com/474x/65/25/a0/6525a08f1df98a2e3a545fe2ace4be47.jpg';
  List<Map<String, String>> _profiles = [];

  String get name => _name;
  String get imageUrl => _imageUrl;
  List<Map<String, String>> get profiles => _profiles;

  void updateName(String newName) {
    _name = newName;
    _addToProfiles(_name, _imageUrl);
    notifyListeners();
  }

  void updateImageUrl(String newImageUrl) {
    _imageUrl = newImageUrl;
    _addToProfiles(_name, _imageUrl);
    notifyListeners();
  }

  void _addToProfiles(String name, String imageUrl) {
    _profiles.add({'name': name, 'imageUrl': imageUrl});
    notifyListeners();
  }
}
