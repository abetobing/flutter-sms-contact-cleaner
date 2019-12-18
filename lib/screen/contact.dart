
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';  
 
class ContactScreen extends StatelessWidget {

  Future<Iterable<Contact>> contacts;
  final String title = 'Contact List';

  // @override
  // State<StatefulWidget> initState() {
  //   super.initState();
  //   contacts = ContactsService.getContacts();
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<Iterable<Contact>>(
        future: ContactsService.getContacts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:          
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final list = snapshot.data.toList();

                // return ListTile(
                //   leading: Icon(Icons.shopping_cart),
                //   title: Text(productInfo['name']),
                //   subtitle: 
                //     Text('price: ${productInfo['price']}USD'),
                // );

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        list[index].displayName,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      subtitle: Text(list[index].phones.join('; ')),
                    );
                  },
                );

                
              }
              break;
          }
        }
      ),
    );
  }

}