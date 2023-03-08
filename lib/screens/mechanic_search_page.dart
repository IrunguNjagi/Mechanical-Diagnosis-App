import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mechanic_dignosis_app/list_content/mechanic_garage_list.dart';
import 'package:mechanic_dignosis_app/screens/garage_information.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  //list of garages
  static List<MechanicModel> main_garage_list = [
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0, '+254700350811'),
    MechanicModel("Tbandz Auto Shop", "Spray Painting", "Enterprise Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
    MechanicModel("TJ & U Auto Shop", "Panel Beating", "Lunga Lunga Road", 5.0,"+254700350811"),
  ];

  // create list to be displayed and filtered
  List<MechanicModel> display_list = List.from(main_garage_list);

  void updateList(String value) {
    //method for search filter
    /*user will search for garage based of their specialty depending on the prediction
    given be the app earlier*/
    setState(() {
      display_list = main_garage_list.where((element) =>
          element.garage_specialty.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00325E),

      appBar: AppBar(
        backgroundColor:Color(0xFF00325E).withOpacity(0.54),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Search for Garage',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
            onChanged: (value) => updateList(value),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter predicted problem: ",
              prefixIcon: Icon(
                FontAwesomeIcons.search,
              ),
            )),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: display_list.length == 0 ? Center(child:
          Text(
            "No result found",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                 color: Colors.white,
                 fontSize: 22.0
            )
          ),
          ):
          ListView.builder(
          itemCount: display_list.length,
          itemBuilder: (context, index) =>
              ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(
                  display_list[index].garage_name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  display_list[index].garage_specialty,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  display_list[index].garage_location,
                  style: TextStyle(
                      color: Colors.white60, fontWeight: FontWeight.bold),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Garage_Info(display_list[index]),
                  ),
                  );
                },
              ),
        ),
      )
      ],
    ),)
    ,
    );
  }
}
