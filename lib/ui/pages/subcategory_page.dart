import 'package:flutter/material.dart';
import 'package:test_sub_in_sub/core/datas/entry_model.dart';
import 'package:test_sub_in_sub/core/datas/json_data.dart';

class SubcategoryPage extends StatefulWidget {
  const SubcategoryPage({Key? key}) : super(key: key);

  @override
  _SubcategoryPageState createState() => _SubcategoryPageState();
}

class _SubcategoryPageState extends State<SubcategoryPage> {
  @override
  Widget build(BuildContext context) {
    List<Entry> entry = [];
    entry = entryModelFromJson(sampleJson);
    return Scaffold(
      appBar: AppBar(title: const Text('2nd test')),
      body: ListView.builder(
        itemCount: entry.length,
        itemBuilder: (context, int index) => EntryItem(entry[index]),
      ),
    );
  }
}

class EntryItem extends StatelessWidget {
  final Entry entry;
  const EntryItem(this.entry, {Key? key}) : super(key: key);

  Widget _buildTiles(Entry root) {
    if (root.subcategories!.isEmpty) {
      return ListTile(title: Text(root.name!));
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.name!),
      children: root.subcategories!.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) => _buildTiles(entry);
  
}
