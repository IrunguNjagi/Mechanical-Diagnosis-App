import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mechanic_dignosis_app/list_content/mechanic_garage_list.dart';
import 'package:mechanic_dignosis_app/screens/mechanic_search_page.dart';

class PredictedProblem extends StatefulWidget {
  final List<String> symptoms;
  String name;
  String suggestedMechanic = "";



  PredictedProblem({@required this.symptoms, this.name = "No results found"});

  @override
  _PredictedProblemState createState() => _PredictedProblemState();
}

class _PredictedProblemState extends State<PredictedProblem> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<String, int> priorityMap = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00325E),
        body: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0.02,
                    right: 12.07,
                  ),
                  child: Container(
                    height: 180,
                    width: 226.93,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/gears_cropped-removebg-preview.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.07,
                    ),
                    child: Text('PREDICTION PAGE',
                        style: TextStyle(
                          fontSize: 23.38,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 160,
                left: 33,
                right: 20,
              ),
              child: Container(
                height: 130,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white.withOpacity(0.9),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _db.collection("malfunctions").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final malfunctions = snapshot.data.docs;
                      List<Widget> predictedMalfunctions = [];
                      List<MechanicModel> suggestedMechanics = [];
                      for (var malfunction in malfunctions) {
                        final malfunctionData = malfunction.data();
                        priorityMap[malfunction.id] = 0;
                        for (var symptom in widget.symptoms) {
                          if (malfunctionData['symptoms'].contains(symptom)) {
                            priorityMap[malfunction.id]++;
                          }
                        }
                      }
                      for (var key in priorityMap.keys) {
                        if (priorityMap[key] > 0) {
                          predictedMalfunctions.add(
                            ListTile(
                              title: Text(
                                "$key",
                                style: TextStyle(
                                  fontSize: 20.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }
                      }

                      if (predictedMalfunctions.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView(
                            children: predictedMalfunctions,
                          ),
                        );
                      } else {
                        // If there are no items to show, return a Text widget with the default value
                        return Center(
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Search_Page()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 360,
                  left: 33,
                  right: 20,
                ),
                child: Container(
                  height: 130,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFFFFFFFF).withOpacity(0.9),
                  ),
                  child: Center(
                    child: Text(
                      "CLICK HERE FOR MECHANIC CHOICE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.5,
                        color: Colors.pink,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
