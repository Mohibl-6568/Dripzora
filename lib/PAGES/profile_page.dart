import 'package:flutter/material.dart';
import 'package:dripzora/DATA_STRUCTURE/user_structure.dart';

class ProfilePage extends StatelessWidget {
  final UserStructure user;
  const ProfilePage({super.key, required this.user});

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersSection() {
    if (user.orders == null || user.orders!.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          'No orders yet.',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Orders:',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...user.orders!.map(
          (order) => Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 4),
            child: Text(
              '• $order',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple[800],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: Image(image: user.profileImage!.image).image,
              backgroundColor: Colors.white24,
            ),
            const SizedBox(height: 30),
            _buildProfileDetail('Username:', user.username ?? 'N/A'),
            _buildProfileDetail('Email:', user.email ?? 'N/A'),
            _buildProfileDetail('Phone:', user.phoneNumber ?? 'N/A'),
            _buildProfileDetail('Address:', user.address ?? 'N/A'),
            _buildOrdersSection(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'EDIT PROFILE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
