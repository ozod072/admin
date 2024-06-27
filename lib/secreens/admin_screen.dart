import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/products_controller.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("A D M I N")),
      ),
      body: profileProvider.profiles.isEmpty
          ? const Center(
        child: Text(
          "Hech qanday ma'lumot yo'q",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      )
          : ListView.builder(
        itemCount: profileProvider.profiles.length,
        itemBuilder: (context, index) {
          final profile = profileProvider.profiles[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profile['imageUrl']!),
            ),
            title: Text(profile['name']!),
          );
        },
      ),
    );
  }
}
