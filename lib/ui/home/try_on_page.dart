import 'dart:io'; // Make sure to import this

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking

class TryOnPage extends StatefulWidget {
  @override
  _OutfitCheckPageState createState() => _OutfitCheckPageState();
}

class _OutfitCheckPageState extends State<TryOnPage> {
  final ImagePicker _picker = ImagePicker();
  Map<String, XFile?> selectedImages = {
    'accessory': null,
    'shirt': null,
    'outerwear': null,
    'skirt': null,
    'footwear': null,
  };

  Future<void> _pickImage(String category) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImages[category] = image;
      });
    }
  }

  void _confirmDiscardOutfit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Discard Outfit"),
          content: Text(
              "Are you sure you want to discard this outfit and start over?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Discard"),
              onPressed: () {
                setState(() {
                  selectedImages = {
                    'accessory': null,
                    'shirt': null,
                    'outerwear': null,
                    'skirt': null,
                    'footwear': null,
                  }; // Reset all selected images
                });
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9EB), // Light background color
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            const Text(
              '#Outfitcheck',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
                color: Color(0xFF3A3A3A),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120  ),
                        child: _buildCategoryButton('accessory', 'Accessory'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: _buildCategoryButton('shirt', 'Shirt'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: _buildCategoryButton('outerwear', 'Outerwear'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: _buildCategoryButton('skirt', 'Skirt'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: _buildCategoryButton('footwear', 'Footwear'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A4054),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // Space between icons
                    children: [
                      IconButton(
                        onPressed: _confirmDiscardOutfit,
                        // Trigger confirmation dialog
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle "Check" button tap
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30, // Icon size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category, String label) {
    return GestureDetector(
      onTap: () => _pickImage(category),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFF3A4054),
            child: selectedImages[category] == null
                ? const Icon(Icons.add, size: 55, color: Colors.white)
                : ClipOval(
                    child: Image.file(
                      File(selectedImages[category]!.path),
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF3A4054),
            ),
          ),
        ],
      ),
    );
  }
}
