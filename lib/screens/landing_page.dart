import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechanic_dignosis_app/screens/mechanic_search_page.dart';
import 'package:mechanic_dignosis_app/screens/predicted_problem.dart';
import 'package:mechanic_dignosis_app/screens/symptom_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Color(0xFF00325E),
              appBar: AppBar(
                backgroundColor:Color(0xFF00325E).withOpacity(0.54) ,
                title: Text('MECHANIC SOURCING APP'),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Symptoms', icon: FaIcon(FontAwesomeIcons.screwdriver),),
                    Tab(text: 'Mechanics', icon: FaIcon(FontAwesomeIcons.carCrash)),
                  ],
                ),
              ),
              body: TabBarView(
                  children: [
                    SymptomsInput(),
                    Search_Page(),
              ]
              ),
            )
        )
    );
  }
}
