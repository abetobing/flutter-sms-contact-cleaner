

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';  
 
class ContactScreen extends StatefulWidget {
  @override
  ContactState createState() =>  ContactState();

}

class ContactState extends State<ContactScreen> {

  Future<List<Contact>> contacts;
  final String title = 'Contact List';

  @override
  State<StatefulWidget> initState() {
    super.initState();
    contacts = ContactsService.getContacts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        //itemCount: contacts.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          return FutureBuilder(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:          
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final item = snapshot.data;

                    // return ListTile(
                    //   leading: Icon(Icons.shopping_cart),
                    //   title: Text(productInfo['name']),
                    //   subtitle: 
                    //     Text('price: ${productInfo['price']}USD'),
                    // );

                    return ListTile(
                      title: Text(
                        item.displayName,
                        style: Theme.of(context).textTheme.headline,
                      ),
                      subtitle: Text(item.displayName),
                    );
                  }
                  break;
              }

              
            }
          );
        },
      ),
    );
  }

}