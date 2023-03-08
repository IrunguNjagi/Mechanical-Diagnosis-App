import 'package:flutter/material.dart';
import 'package:mechanic_dignosis_app/screens/predicted_problem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SymptomsInput extends StatefulWidget {
  @override
  _SympstomsInputState createState() => _SympstomsInputState();
}

class _SympstomsInputState extends State<SymptomsInput> {
  List<String> carSymptoms = [];
  String symptom;

  List<Widget> convertToTile(List<String> symptomStrings) {
    List<Widget> symptomTile = [];
    for (int i = 0; i < symptomStrings.length; ++i) {
      symptomTile.add(Container(
        height: 65,
        width: 390,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 2.5,
          child: ListTile(
            trailing: IconButton(
              icon: FaIcon(FontAwesomeIcons.times, color: Color(0xFFD60000)),
              onPressed: () {
                setState(() {
                  symptomStrings.remove(symptomStrings[i]);
                });
              },
            ),
            title: Text(
              symptomStrings[i],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.5,
              ),
            ),
          ),
        ),
      ));
      symptomTile.add(SizedBox(
        height: 8,
      ));
    }

    symptomTile.add(Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PredictedProblem(
                        symptoms: symptomStrings,
                      )));
        },
        child: Container(
          width: 230,
          height: 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Predict Car Problem",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.5,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color(0x00325E),
            border: Border.all(width: 1.0, color: const Color(0xff3f9bfc)),
          ),
        ),
      ),
    ));
    return symptomTile;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      image: AssetImage('assets/images/gears_cropped-removebg-preview.png'),
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
                  child: Text(
                    'DIAGNOSIS PAGE',
                    style: TextStyle(
                      fontSize: 23.38,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    )
                  ),
                ),
              ),
            ],
          ),*/
        /*Padding(
        padding: const EdgeInsets.only(
          top: 180,
          left: 17,
          bottom: 34,
        ),*/
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
          ),
          child: Container(
            height: 450,
            width: 450,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.54),
                borderRadius: BorderRadius.circular(12.0)),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 11,
                  ),
                  child: Text(
                    "Status of your car today? ",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      fontSize: 23.38,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          symptom = value;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "What signs are your car showing?",
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(17.5)),
                          borderSide:
                              BorderSide(color: Color(0xFFFFFFFF), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFF), width: 1.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(17.5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFFFFFF), width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(17.5)),
                        ),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: FaIcon(FontAwesomeIcons.plusCircle,
                        color: Colors.black, size: 30),
                    onPressed: () {
                      if (symptom != null && symptom.length != 0) {
                        setState(() {
                          carSymptoms.add(symptom);
                          symptom = null;
                        });
                      } else {
                        print("No problem added");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                carSymptoms.length != 0
                    ? Column(
                        children: convertToTile(carSymptoms),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Your car is in mint condition :)",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
