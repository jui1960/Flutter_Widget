import 'package:flutter/material.dart';

import 'Db_helper.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic>? user;

  const DetailsScreen({super.key, required this.user});

  @override
  State<DetailsScreen> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.user == null) {
      return const Scaffold(
        body: Center(child: Text('No User Data Found!')),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [

                  CircleAvatar(
                    radius:40 ,
                    backgroundColor: Color(0xFF5A1B24),
                    child: Icon(Icons.person , size: 40,color: Colors.white,),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    widget.user![DbHelper.COLUMN_USER_NAME] ?? 'Unknown User',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),

                  const Divider(height: 32, thickness: 1),


                  _buildInfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email Address',
                    value: widget.user![DbHelper.COLUMN_EMAIL] ?? 'N/A',
                  ),
                  _buildInfoTile(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value:
                        widget.user![DbHelper.COLUMN_ADDRESS] ??
                        'No Address Provided',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF5A1B24), size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1A1A2E),
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
