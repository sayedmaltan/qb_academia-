
import 'package:flutter/material.dart';
import 'package:qb_academia/features/home/presentation/views/widgets/profile_controller.dart';


class ProfileImagePicker extends StatefulWidget {
  final ImageProvider image;
  final Function(ImageProvider) onImageSelected;

  const ProfileImagePicker({
    super.key,
    required this.image,
    required this.onImageSelected,
  });

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  final ProfileController _controller = ProfileController();
  ImageProvider _currentImage = const AssetImage(
      'assets/images/default_avatar.png');

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  void _loadSavedImage() async {
    final image = await _controller.loadSavedImage();
    setState(() {
      _currentImage = image;
    });
    widget.onImageSelected(image);
  }

  void _pickImage() async {
    final imageFile = await _controller.pickAndSaveImage();
    if (imageFile != null) {
      final newImage = FileImage(imageFile);
      setState(() {
        _currentImage = newImage;
      });
      widget.onImageSelected(newImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: const Color(0xFFF9C19A),
            backgroundImage: _currentImage,
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

