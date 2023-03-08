import 'package:flutter/material.dart';
import 'package:mechanic_dignosis_app/list_content/mechanic_garage_list.dart';
import 'mechanic_search_page.dart';

class Garage_Info extends StatelessWidget {
  final MechanicModel display_list;

  Garage_Info(this.display_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(display_list.garage_name),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 90,
                  ),
                  title: SelectableText(
                    display_list.garage_contact != null
                        ? display_list.garage_contact
                        : 'default',
                  ),
                  subtitle: Text(
                    display_list.garage_location != null
                        ? display_list.garage_location
                        : 'default',
                  ),
                )
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.green.withOpacity(0.54),
              ),
            ),
          )),
    );
  }
}
