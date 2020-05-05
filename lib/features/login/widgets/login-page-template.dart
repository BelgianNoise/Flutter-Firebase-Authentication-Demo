import 'package:flutter/material.dart';
import 'package:no/common/theme/measures.dart';

class RALoginPageTemplate extends StatelessWidget {

  const RALoginPageTemplate({
    this.child,
    this.scaffoldKey,
  });

  final Widget child;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/loginBackground.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(gutterLarge),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration( color: Color(0xF5FFFFFF) ),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: Padding(
                padding: const EdgeInsets.all(gutterLarge),
                child: SingleChildScrollView(
                  child: this.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}