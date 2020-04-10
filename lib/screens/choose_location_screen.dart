import 'package:flutter/material.dart';
import 'package:worldclockapp/models/locations_data.dart';

class ChooseLocationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final LocationsData data = new LocationsData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
            ),
            title: Text(data.list[index].locationName,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'ComicNeue',
            )),
            onTap: () {
              Navigator.pop(context, data.list[index]);
            },
          ),
        );
      },
      itemCount: data.list.length),
    );
  }
}
