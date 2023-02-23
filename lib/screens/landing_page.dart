import 'package:flutter/material.dart';
import 'package:mechanic_dignosis_app/screens/predicted_problem.dart';
import 'package:mechanic_dignosis_app/screens/symptom_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: DefaultTabController(
            length: 1,
            child: Scaffold(
              appBar: AppBar(
                title: Text('MECHANICAL DIAGNOSIS APP'),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Symptoms'),
                  ],
                ),
              ),
              body: TabBarView(
                  children: [
                    SympstomsInput(),
              ]
              ),
            )
        )
    );
  }
}
