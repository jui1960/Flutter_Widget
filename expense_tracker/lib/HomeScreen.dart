import 'package:expense_tracker/ProfileScreen.dart';
import 'package:expense_tracker/SignUpScreen.dart';
import 'package:expense_tracker/ThemeProvider.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddScreen.dart';
import 'DbHelper.dart';
import 'DetailsScreen.dart';
import 'SignInScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String userName = "user";

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final primaryColor = const Color(0xFF2ECC71);
    final topCardColor = isDark ? Colors.grey.shade900 : primaryColor;
    final backgroundColor = isDark ? Colors.black : Colors.grey.shade50;
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.grey.shade400 : Colors.grey.shade600;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DbHelper.getInstance.fetchAllExpense(),
        builder: (context, snapshot) {
          List<Map<String, dynamic>> expenseList = snapshot.data ?? [];

          double totalSpend = 0;
          for (var item in expenseList) {
            double price =
                double.tryParse(item[DbHelper.COLUMN_PRICE].toString()) ?? 0.0;
            totalSpend += price;
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 24,
                  bottom: 25,
                ),
                decoration: BoxDecoration(
                  color: topCardColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Row(
                          children: [
                            Consumer<ThemeProvider>(
                              builder: (context, themeProvider, child) {
                                return IconButton(
                                  icon: Icon(
                                    themeProvider.isDarkMode
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => themeProvider.toggleTheme(
                                    !themeProvider.isDarkMode,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                final pref =
                                    await SharedPreferences.getInstance();
                                await pref.setBool(
                                  SplashScreenState.LOGINKEY,
                                  false,
                                );
                                if (!context.mounted) return;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "TODAY IS",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Hello, $userName 👋",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "THIS MONTH'S SPEND",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$${totalSpend.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "67% below last month",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: cardColor,
                        elevation: isDark ? 0 : 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.account_balance_wallet,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(width: 17),
                              Text(
                                "Spending Wallet",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "\$5,631.22",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                Icons.chevron_right,
                                color: subTextColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "RECENT TRANSACTIONS",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: subTextColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (snapshot.connectionState == ConnectionState.waiting)
                        const Center(child: CircularProgressIndicator())
                      else if (expenseList.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Center(
                            child: Text(
                              "No expenses added yet!",
                              style: TextStyle(
                                color: subTextColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: expenseList.length,
                          itemBuilder: (context, index) {
                            var item = expenseList[index];
                            return InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      sno: item[DbHelper.COLUMN_SERIAL_NO],
                                      title: item[DbHelper.COLUMN_TITLE] ?? "",
                                      price: item[DbHelper.COLUMN_PRICE] ?? "",
                                      details: item[DbHelper.COLUMN_DESC] ?? "",
                                      date: item[DbHelper.COLUMN_DATE] ?? "",
                                    ),
                                  ),
                                ).then((isDataChanged) {
                                  if (isDataChanged == true) {
                                    setState(() {});
                                  }
                                });
                              },

                              child: _buildTransactionItem(
                                sno: item[DbHelper.COLUMN_SERIAL_NO],
                                icon: Icons.receipt_long,
                                iconBg: primaryColor.withOpacity(0.15),
                                iconColor: primaryColor,
                                title: item[DbHelper.COLUMN_TITLE] ?? "",
                                date: item[DbHelper.COLUMN_DATE] ?? "",
                                amount: "-\$${item[DbHelper.COLUMN_PRICE]}",
                                textColor: textColor,
                                subTextColor: subTextColor,
                                onDelete: () {
                                  setState(() {});
                                },
                                onEdit: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddScreen(
                                        sno: item[DbHelper.COLUMN_SERIAL_NO],
                                        title: item[DbHelper.COLUMN_TITLE],
                                        price: item[DbHelper.COLUMN_PRICE],
                                        details: item[DbHelper.COLUMN_DESC],
                                        date: item[DbHelper.COLUMN_DATE],
                                      ),
                                    ),
                                  ).then((isUpdate) {
                                    if (isUpdate == true) {
                                      setState(() {});
                                    }
                                  });
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isAdded = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );

          if (isAdded == true) {
            setState(() {});
          }
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: cardColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: primaryColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bar_chart, color: subTextColor),
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.repeat, color: subTextColor),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: subTextColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required int sno,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String date,
    required String amount,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onDelete,
    required VoidCallback onEdit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 3,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: iconBg,
                radius: 20,
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: TextStyle(fontSize: 12, color: subTextColor),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: onEdit,
                        borderRadius: BorderRadius.circular(20),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 2.0,
                          ),
                          child: Icon(Icons.edit, size: 16, color: Colors.blue),
                        ),
                      ),

                      const SizedBox(width: 4),

                      InkWell(
                        onTap: () async {
                          bool? confirm = await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Delete Expense"),
                              content: const Text(
                                "Are you sure you want to delete this?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            bool isSuccess = await DbHelper.getInstance
                                .deleteExpense(sno: sno);
                            if (isSuccess) {
                              onDelete();
                            }
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 4.0,
                            top: 2.0,
                            bottom: 2.0,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 16,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    userName = pref.getString(SignUpScreenState.NAMEKEY) ?? "user";
    setState(() {});
  }
}
