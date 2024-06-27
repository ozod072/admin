import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/products_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _textController.text = profileProvider.name;
    _imageUrlController.text = profileProvider.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              _showEditDialog(context, profileProvider);
            },
            child: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipOval(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.amberAccent,
                      backgroundImage: NetworkImage(profileProvider.imageUrl),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 160, // CircleAvatar radius * 2
                        width: 160, // CircleAvatar radius * 2
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 32, // 20% of 160
                            width: 160, // same as avatar diameter
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  _showEditDialog(context, profileProvider);
                                },
                                child: const Text('Edit'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 20,
            width: 50,
            child: Text(_textController.text),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              profileProvider.updateName(_textController.text);
            },
            child: const Text('S A Q L A'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  void _showEditDialog(BuildContext context, ProfileProvider profileProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rasim linki va Nameni kiriting'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Yangi rasm URL manzilini kiriting',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Yangi ismingizni kiriting',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Bekor qilish'),
            ),
            ElevatedButton(
              onPressed: () {
                profileProvider.updateImageUrl(_imageUrlController.text);
                profileProvider.updateName(_textController.text);
                Navigator.pop(context);
              },
              child: const Text('Yangilash'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}
