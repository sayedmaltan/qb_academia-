import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  static const String _imageKey = 'user_profile_image';

  Future<File?> pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = pickedFile.name;
      final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_imageKey, savedImage.path);

      return savedImage;
    }

    return null;
  }

  Future<ImageProvider> loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_imageKey);

    if (path != null && File(path).existsSync()) {
      return FileImage(File(path));
    } else {
      return const AssetImage('assets/image/download.jpeg');
    }
  }
}
