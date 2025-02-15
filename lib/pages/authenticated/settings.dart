import 'package:flutter/material.dart';
import 'package:yearly/auth/auth_service.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    final currentnUserEmail = authService.getCurrentUserEmail();
    final currentUserDisplayName = authService.getCurrentUserDisplayName();

    return  Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0), // Adds spacing
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Aligns items properly
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(44, 132, 255, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                SizedBox(width: 12), // Adds spacing between the avatar and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                  children: [
                    Text(
                      currentUserDisplayName ?? 'No Display Name',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4), // Adds spacing between display name and email
                    Text(
                      currentnUserEmail ?? 'No Email',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Text(data['email'] ?? 'No Email'),
                    
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
