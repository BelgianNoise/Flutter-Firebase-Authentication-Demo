import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:no/features/activity/pages/activity-page.dart';
import 'package:no/features/recipes/pages/recipes-page.dart';
import 'package:provider/provider.dart';

class AJTab{
  const AJTab({ this.child, this.page });

  final Widget child;
  final Widget page;
}

class RAHomePage extends StatefulWidget {

  @override
  _RAHomePageState createState() => _RAHomePageState();
}

class _RAHomePageState extends State<RAHomePage> {
  final List<AJTab> tabs = [
    AJTab( child: Text('Activiteit'), page: ARActivityPage() ),
    AJTab( child: Text('Recepten'), page: RARecipesPage() ),
    AJTab( child: Text('Profiel'), page: RARecipesPage() ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text( 'Welkom ' + Provider.of<FirebaseUser>(context).displayName ) ,
          actions: <Widget>[
            IconButton(
              icon: Icon( Icons.settings ),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
          bottom: TabBar(
            tabs: this.tabs.map( (AJTab t) {
              return Tab( child: t.child, );
            } ).toList(),
          ),
        ),
        body: TabBarView(
          children: this.tabs.map( (AJTab t) {
            return t.page;
          } ).toList(),
        ),
      ),
    );
  }
}