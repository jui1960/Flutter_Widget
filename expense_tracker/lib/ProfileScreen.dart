import 'package:expense_tracker/SignUpScreen.dart';
import 'package:expense_tracker/ThemeProvider.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<Map<String, String>> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString(SignUpScreenState.NAMEKEY) ?? "User Name";
    String email = prefs.getString(SignUpScreenState.EMAILKEY) ?? "user@example.com";

    return {
      'name': name,
      'email': email,
    };
  }

  void _showEditNameDialog(BuildContext context, String currentName) {
    final TextEditingController nameController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Edit Name"),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: "Full Name",
            hintText: "Enter your name",
            prefixIcon: const Icon(Icons.person_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () async {
              String newName = nameController.text.trim();
              if (newName.isNotEmpty) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(SignUpScreenState.NAMEKEY, newName);

                if (mounted) {
                  Navigator.pop(ctx);
                  setState(() {});

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Name updated successfully!"),
                      backgroundColor: Color(0xFF2ECC71),
                    ),
                  );
                }
              }
            },
            child: const Text("Save", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF2ECC71);
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data;
          final userName = userData?['name'] ?? "User Name";
          final userEmail = userData?['email'] ?? "user@example.com";

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: primaryColor, width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 46,
                              backgroundColor: primaryColor.withOpacity(0.15),
                              child: Icon(Icons.person, size: 55, color: primaryColor),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        userEmail,
                        style: TextStyle(
                          fontSize: 14,
                          color: subTextColor,
                        ),
                      ),
                      const SizedBox(height: 12),

                      OutlinedButton.icon(
                        onPressed: () => _showEditNameDialog(context, userName),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: primaryColor,
                          side: BorderSide(color: primaryColor.withOpacity(0.5)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                        ),
                        icon: const Icon(Icons.edit, size: 16),
                        label: const Text("Edit UserName", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                _buildSectionHeader("Preferences", subTextColor),
                const SizedBox(height: 8),

                Card(
                  color: cardColor,
                  elevation: isDark ? 0 : 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildProfileTile(
                        icon: Icons.language,
                        iconColor: primaryColor,
                        title: "Language",
                        subtitle: "English",
                        textColor: textColor,
                        subTextColor: subTextColor,
                        onTap: () {},
                      ),
                      Divider(height: 1, indent: 60, endIndent: 16, color: Colors.grey.withOpacity(0.2)),

                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                            color: Colors.purple,
                            size: 22,
                          ),
                        ),
                        title: Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: textColor,
                          ),
                        ),
                        subtitle: Text(
                          themeProvider.isDarkMode ? "Enabled" : "Disabled",
                          style: TextStyle(color: subTextColor, fontSize: 13),
                        ),
                        trailing: Switch(
                          activeColor: primaryColor,
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            themeProvider.toggleTheme(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                _buildSectionHeader("Account & Security", subTextColor),
                const SizedBox(height: 8),

                Card(
                  color: cardColor,
                  elevation: isDark ? 0 : 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildProfileTile(
                        icon: Icons.logout_rounded,
                        iconColor: Colors.orange,
                        title: "Log Out",
                        textColor: Colors.orange,
                        subTextColor: subTextColor,
                        onTap: () => _showLogoutDialog(context),
                      ),
                      Divider(height: 1, indent: 60, endIndent: 16, color: Colors.grey.withOpacity(0.2)),

                      _buildProfileTile(
                        icon: Icons.delete_forever_rounded,
                        iconColor: Colors.red,
                        title: "Delete Account Permanently",
                        textColor: Colors.red,
                        subTextColor: subTextColor,
                        onTap: () => _showDeleteAccountDialog(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
          color: color,
        ),
      ),
    );
  }


  Widget _buildProfileTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: textColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: subTextColor, fontSize: 13))
          : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Log Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool(SplashScreenState.LOGINKEY, false);

              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      (route) => false,
                );
              }
            },
            child: const Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Delete Account"),
        content: const Text(
          "Are you sure you want to permanently delete your account? All saved data will be erased.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () async {
              Navigator.pop(ctx);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();

              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      (route) => false,
                );
              }
            },
            child: const Text("Delete", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}