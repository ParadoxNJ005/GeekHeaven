import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert'; // For jsonEncode and jsonDecode

class DialogTravalList extends StatefulWidget {
  const DialogTravalList({super.key});

  @override
  State<DialogTravalList> createState() => _DialogTravalListState();
}

class _DialogTravalListState extends State<DialogTravalList> {
  final secureStorage = FlutterSecureStorage();

  List<Map<String, dynamic>> travelItems = [];
  final TextEditingController itemController = TextEditingController();
  String? lastAddedItem;

  static const String secureKeyLastAdded = 'lastAddedItem';
  static const String secureKeyItems = 'items';

  @override
  void initState() {
    super.initState();
    loadItems();
    loadLastAddedItem();
  }

  Future<void> loadItems() async {
    String? storedItems = await secureStorage.read(key: secureKeyItems);
    if (storedItems != null) {
      setState(() {
        // Convert the stored JSON string into a list of maps
        travelItems = List<Map<String, dynamic>>.from(
          jsonDecode(storedItems).map((item) {
            return {
              'item': item['item'],
              'checked': item['checked'],
            };
          }),
        );
      });
    }
  }

  Future<void> loadLastAddedItem() async {
    String? item = await secureStorage.read(key: secureKeyLastAdded);
    setState(() {
      lastAddedItem = item;
    });
  }

  Future<void> addItem(String item) async {
    if (item.isNotEmpty) {
      setState(() {
        travelItems.add({
          'item': item,
          'checked': false,
        });
      });
      await secureStorage.write(
        key: secureKeyItems,
        value: jsonEncode(travelItems),
      );
      await secureStorage.write(key: secureKeyLastAdded, value: item);
      setState(() {
        lastAddedItem = item;
      });
      itemController.clear();
    }
  }

  Future<void> deleteItem(int index) async {
    setState(() {
      travelItems.removeAt(index);
    });
    await secureStorage.write(
      key: secureKeyItems,
      value: jsonEncode(travelItems),
    );
  }

  void toggleCheckBox(int index, bool? value) {
    setState(() {
      travelItems[index]['checked'] = value ?? false;
    });
    // Optionally update the storage after changing the checkbox state
    secureStorage.write(
      key: secureKeyItems,
      value: jsonEncode(travelItems),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Travel Checklist'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: itemController,
                      decoration: const InputDecoration(
                        hintText: 'Enter travel item',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => addItem(itemController.text),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            if (lastAddedItem != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Last added: $lastAddedItem',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: travelItems.length,
                itemBuilder: (context, index) {
                  final item = travelItems[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: Checkbox(
                        value: item['checked'],
                        onChanged: (bool? value) {
                          toggleCheckBox(index, value);
                        },
                      ),
                      title: Text(item['item']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
