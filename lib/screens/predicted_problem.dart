import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PredictedProblem extends StatefulWidget {
  final List<String> symptoms;
  PredictedProblem({@required this.symptoms});

  @override
  _PredictedProblemState createState() => _PredictedProblemState();
}

class _PredictedProblemState extends State<PredictedProblem> {

  FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<String , int> priorityMap = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Predict Car Problem")
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _db.collection("malfunctions").snapshots(),
            builder: (context , snapshot) {
              if(snapshot.hasData){
                final malfunctions = snapshot.data.docs;
                List<Widget> predictedMalfunctions = [];
                for(var malfunction in malfunctions){
                  final malfucntionData = malfunction.data();
                  priorityMap[malfunction.id] = 0;
                  for (var symptom in widget.symptoms){
                    if (malfucntionData['symptoms'].contains(symptom)){
                      priorityMap[malfunction.id]++;
                    }
                  }
                }
                for (var key in priorityMap.keys){
                  if (priorityMap[key] > 0){
                    predictedMalfunctions.add(
                        ListTile(
                            title: Text(
                              "$key",
                              style: TextStyle(
                                fontSize: 20.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: priorityMap[key] > 3 ? Text(
                              "High Probability",
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff53920)
                              ),
                            ) :  Text(
                              "Low Probability",
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfff2da1f)
                              ),
                            )
                        )
                    );
                  }
                }
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: predictedMalfunctions,
                  ),
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
              },
          )
      ),
    );
  }
}

