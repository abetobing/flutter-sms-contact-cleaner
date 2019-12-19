
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';  
 
class ContactScreen extends StatefulWidget {

  @override
  ContactScreenState createState() => ContactScreenState();

}



class ContactScreenState extends State<ContactScreen> {
  final String title = 'Contact List Screen';
  Future<Iterable<Contact>> contacts;

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
      body: FutureBuilder<Iterable<Contact>>(
        future: contacts,
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

                return ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ContactItemCard(
                      contact: list[index],
                    );
                  }, 
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                );

                
              }
              break;
          }
        }
      ),
    );
  }

}


class ContactItemCard extends StatelessWidget {

  final Contact contact;

  const ContactItemCard({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var composeAdditionalContactInfo2 = composeAdditionalContactInfo();
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person , color: Colors.blueGrey, size: 32),
            ],
          ),
          VerticalDivider(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: composeAdditionalContactInfo2
            ),
          ),
          
        ],
      ),
    );
  }

  List<Widget> composeAdditionalContactInfo() {
    List<Widget> additionalInfo = new List();

    additionalInfo.add(
      Text(
        contact.displayName,
        style: TextStyle(
          fontSize: 20.0
        ),
      )
    );

    TextStyle style = TextStyle(
      color: Colors.grey
    );
    for (Item p in contact.phones) {
      additionalInfo.add(
        Text(p.value, style: style)
      );
    }
    for (Item p in contact.emails) {
      additionalInfo.add(
        Text(p.value, style: style)
      );
    }
    return additionalInfo;
  }

}