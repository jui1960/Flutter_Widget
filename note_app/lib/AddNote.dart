import 'package:flutter/material.dart';

import 'Db_Helper.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<StatefulWidget> createState() => AddNoteState();
}

class AddNoteState extends State<AddNote> {
  var titleController = TextEditingController();
  var subtitleController = TextEditingController();

  DbHelper dbRef = DbHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Note',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Create New Note',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const Text(
                'Write down your thoughts or tasks below.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  labelText: 'Title',
                  labelStyle: const TextStyle(color: Colors.teal),
                  prefixIcon: const Icon(
                    Icons.title_rounded,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: subtitleController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2),
                  ),
                  labelText: 'Description',
                  labelStyle: const TextStyle(color: Colors.teal),
                  prefixIcon: Icon(
                    Icons.description_outlined,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 35),

              GestureDetector(
                onTap: () async {
                  var title = titleController.text;
                  var subtitle = subtitleController.text;
                  if (title.isNotEmpty && subtitle.isNotEmpty) {
                    await dbRef.addNote(mTitle: title, mSubtitle: subtitle);
                    if (context.mounted) {
                      Navigator.pop(context);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.teal],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Save Note',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
