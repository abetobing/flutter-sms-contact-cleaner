import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:sms_contact_cleaner_util/screen/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    // return MultiProvider(
    //   providers: [
    //     // In this sample app, CatalogModel never changes, so a simple Provider
    //     // is sufficient.
    //     Provider(create: (context) => CatalogModel()),
    //     // CartModel is implemented as a ChangeNotifier, which calls for the use
    //     // of ChangeNotifierProvider. Moreover, CartModel depends
    //     // on CatalogModel, so a ProxyProvider is needed.
    //     ChangeNotifierProxyProvider<CatalogModel, CartModel>(
    //       create: (context) => CartModel.empty(),
    //       update: (context, catalog, previousCart) =>
    //           CartModel(catalog, previousCart),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     title: 'Provider Demo',
    //     theme: appTheme,
    //     initialRoute: '/',
    //     routes: {
    //       // '/': (context) => OverviewScreen(),
    //       '/contact': (context) => ContactScreen(),
    //     },
    //   ),
    // );

    return MaterialApp(
        title: 'Sms and Contact Cleaner',
        // theme: appTheme,
        initialRoute: '/contact',
        routes: {
          // '/': (context) => OverviewScreen(),
          '/contact': (context) => ContactScreen(),
        },
      );
  }
}
