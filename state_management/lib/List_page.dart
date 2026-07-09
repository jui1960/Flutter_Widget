import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/list_map_provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('list')),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, _) {
          var allData = provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      elevation: 5,
                      child: ListTile(
                        title: Text(allData[index]['name']),
                        subtitle: Text(allData[index]['roll']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Icon(Icons.edit, color: Colors.blue),
                            SizedBox(width: 10),
                            Icon(Icons.delete, color: Colors.red),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No Context'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<ListMapProvider>().addData({
            "name": "Jui",
            "roll": "53",
          });
        },
      ),
    );
  }
}
