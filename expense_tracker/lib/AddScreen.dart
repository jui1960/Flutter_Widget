import 'package:flutter/material.dart';
import 'DbHelper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  var titleController = TextEditingController();
  var disController = TextEditingController();
  var priceController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    titleController.dispose();
    disController.dispose();
    priceController.dispose();
    super.dispose();
  }

  // 📅 তারিখ সিলেক্ট করার মেথড
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Expense"),
        backgroundColor: const Color(0xFF2ECC71),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Enter your title",
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter your price",
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: disController,
              decoration: const InputDecoration(
                hintText: "Enter your Description",
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Date Selection
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                ),
                onPressed: _saveExpense,
                child: const Text("Save Expense", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _saveExpense() async {
    String mTitle = titleController.text.trim();
    String mPrice = priceController.text.trim();
    String mDetails = disController.text.trim();
    String mDate = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

    if (mTitle.isNotEmpty && mPrice.isNotEmpty) {
      bool isSuccess = await DbHelper.getInstance.addExpense(
        mTitle: mTitle,
        mDetails: mDetails,
        mPrice: mPrice,
        mDate: mDate,
      );

      if (isSuccess) {
        if (!mounted) return;
        Navigator.pop(context, true);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Title & Price mandatory!")),
      );
    }
  }
}