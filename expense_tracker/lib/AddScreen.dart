import 'package:flutter/material.dart';
import 'DbHelper.dart';

class AddScreen extends StatefulWidget {
  final int? sno;
  final String? title;
  final String? price;
  final String? details;
  final String? date;
  final String userEmail;

  const AddScreen({
    super.key,
    this.sno,
    this.title,
    this.price,
    this.details,
    this.date,
    required this.userEmail,
  });

  @override
  State<AddScreen> createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  var titleController = TextEditingController();
  var disController = TextEditingController();
  var priceController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();

    if (widget.sno != null) {
      isEditMode = true;
      titleController.text = widget.title ?? "";
      priceController.text = widget.price ?? "";
      disController.text = widget.details ?? "";

      if (widget.date != null && widget.date!.contains('/')) {
        List<String> parts = widget.date!.split('/');
        if (parts.length == 3) {
          int day = int.tryParse(parts[0]) ?? DateTime.now().day;
          int month = int.tryParse(parts[1]) ?? DateTime.now().month;
          int year = int.tryParse(parts[2]) ?? DateTime.now().year;
          selectedDate = DateTime(year, month, day);
        }
      }
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    disController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF2ECC71)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFF2ECC71);
    final backgroundColor = isDark ? Colors.black : Colors.grey.shade50;
    final cardColor = isDark ? Colors.grey.shade900 : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          isEditMode ? "Edit Expense" : "Add New Expense",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          children: [
            Card(
              color: cardColor,
              elevation: isDark ? 0 : 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCustomTextField(
                      controller: titleController,
                      label: "Title",
                      hint: "e.g., Grocery Shopping",
                      icon: Icons.title,
                      primaryColor: primaryColor,
                      textColor: textColor,
                    ),
                    const SizedBox(height: 10),

                    _buildCustomTextField(
                      controller: priceController,
                      label: "Price (\$)",
                      hint: "e.g., 50.00",
                      icon: Icons.attach_money,
                      keyboardType: TextInputType.number,
                      primaryColor: primaryColor,
                      textColor: textColor,
                    ),
                    const SizedBox(height: 10),

                    _buildCustomTextField(
                      controller: disController,
                      label: "Description",
                      hint: "e.g., Purchased veggies and fruits",
                      icon: Icons.notes,
                      maxLines: 3,
                      primaryColor: primaryColor,
                      textColor: textColor,
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => _selectDate(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: primaryColor.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: primaryColor,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 3,
                  shadowColor: primaryColor.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _saveExpense,
                icon: Icon(
                  isEditMode
                      ? Icons.check_circle_outline
                      : Icons.add_circle_outline,
                  color: Colors.white,
                ),
                label: Text(
                  isEditMode ? "Update Expense" : "Save Expense",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required Color primaryColor,
    required Color textColor,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: TextStyle(color: textColor, fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(icon, color: primaryColor),
            filled: true,
            fillColor: primaryColor.withOpacity(0.05),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  void _saveExpense() {
    String mTitle = titleController.text.trim();
    String mPrice = priceController.text.trim();
    String mDetails = disController.text.trim();
    String mDate =
        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

    if (mTitle.isNotEmpty && mPrice.isNotEmpty) {
      if (isEditMode) {
        DbHelper.getInstance
            .updateExpense(
              mTitle: mTitle,
              mDes: mDetails,
              mPrice: mPrice,
              mDate: mDate,
              sno: widget.sno!,
            )
            .then((isSuccess) {
              if (isSuccess && mounted) {
                Navigator.pop(context, true);
              }
            });
      } else {
        DbHelper.getInstance
            .addExpense(
              mTitle: mTitle,
              mDetails: mDetails,
              mPrice: mPrice,
              mDate: mDate,
              mEmail: widget.userEmail,
            )
            .then((isSuccess) {
              if (isSuccess && mounted) {
                Navigator.pop(context, true);
              }
            });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title & Price are mandatory!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
