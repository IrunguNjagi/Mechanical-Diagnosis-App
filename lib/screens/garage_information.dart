import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechanic_dignosis_app/list_content/mechanic_garage_list.dart';
import 'mechanic_search_page.dart';

class Garage_Info extends StatelessWidget {
  final MechanicModel display_list;

  Garage_Info(this.display_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00325E),
      appBar: AppBar(
        title: Text(display_list.garage_name),
        backgroundColor: Color(0xFF00325E).withOpacity(0.54),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              height: 330,
              width: 380,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.car,
                    size: 55,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 90,
                    ),
                    title: SelectableText(
                      display_list.garage_contact != null
                          ? display_list.garage_contact
                          : 'default',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    subtitle: Text(
                      display_list.garage_location != null
                          ? display_list.garage_location
                          : 'default',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFFD9D9D9).withOpacity(0.72),
              ),
            ),
          )),
    );
  }
}
