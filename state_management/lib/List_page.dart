import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/AddScreen.dart';
import 'package:state_management/list_map_provider.dart';

class ListPage extends StatelessWidget {
  static const String NAMEKEY = 'name';
  static const String ROLLKEY = 'roll';
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
                        title: Text(allData[index][NAMEKEY]),
                        subtitle: Text(allData[index][ROLLKEY]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            IconButton(onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Addscreen(
                                    isEdit: true,
                                    index: index,
                                    oldData: allData[index],
                                  ),
                                ),
                              );
                            }, icon: Icon(
                              Icons.edit, color: Colors.greenAccent,)),
                            SizedBox(width: 10,),
                            IconButton(onPressed: () {
                              context.read<ListMapProvider>().deleteData(index);
                            }, icon: Icon(
                              Icons.delete, color: Colors.red,))


                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No Context Yet'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => Addscreen()));
        },
      ),
    );
  }
}
