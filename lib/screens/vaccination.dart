import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

class VaccinationTracker extends StatefulWidget {
  @override
  _VaccinationTrackerState createState() => _VaccinationTrackerState();
}

class _VaccinationTrackerState extends State<VaccinationTracker> {
  List<Item> data;
  String childName;
  String bornDate = '04-11-2020';

  Future<Null> getUserdata() async {
    await SharedPreferences.getInstance().then((prefs) {
      setState(() {
        childName = prefs.getString('name');
        bornDate = prefs.getString('dob');
        print(' insside function $bornDate');
        data = generateItems(vaccinesDetails.length, bornDate);
      });
    });

    //setState(() {});
  }

  @override
  void initState() {
    super.initState();
    print('indside initSatet()');

    getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    // getUserdata();
    print('inside buildmethod');
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Details'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: data == null
          ? loadingDialog()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  borderOnForeground: true,
                  shadowColor: Colors.orange,
                  elevation: 10,
                  child: Column(
                    children: [
                      FittedBox(
                          child: Text(
                        'Indian Government Schedule',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )),
                      ListTile(
                        leading: Icon(Icons.child_care),
                        title: Text('Child Name : $childName',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                      ListTile(
                        leading: Icon(Icons.child_care),
                        title: Text(
                          'Birth Date : $bornDate',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    //  height: 500,
                    margin: EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      child: Card(
                        child: ExpansionPanelList(
                            dividerColor: Colors.black,
                            expansionCallback: (int index, bool isExpand) {
                              setState(() {
                                // print(data[index].check);
                                data[index].isExpanded = !isExpand;
                              });
                            },
                            children: data.map((item) {
                              return ExpansionPanel(
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return ListTile(
                                    title: Text(item.headerValue),
                                    leading: Icon(Icons.calendar_today),
                                    subtitle:
                                        Text('due Date ${item.vaccineDate}'),
                                  );
                                },
                                body: Column(
                                    children:
                                        item.vaccineNames.map((vaccineNames) {
                                  return Card(
                                      child: ListTile(
                                    leading: Icon(Icons.access_alarm),
                                    title: Text(vaccineNames),
                                  ));
                                }).toList()),
                                isExpanded: item.isExpanded,
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class Item {
  Item({
    this.vaccineNames,
    this.headerValue,
    this.vaccineDate,
    this.isExpanded = false,
    this.check = false,
  });

  List<String> vaccineNames;
  String headerValue;
  bool isExpanded;
  String vaccineDate;
  bool check;
}

List<Item> generateItems(int numberOfItems, bornDate) {
  // var date2 = Jiffy(bornDate, "dd-MM-yyyy");

  // print('insidegenerate() $date2');
  print(' generateItems $bornDate');
  var inputFormat = DateFormat("dd-MM-yyyy");
  var data1 = inputFormat.parse(bornDate);

  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: vaccinesDetails[index]['Header'],
      vaccineDate: data1
              .add(Duration(days: vaccinesDetails[index]['range']))
              .day
              .toString() +
          '/' +
          data1
              .add(Duration(days: vaccinesDetails[index]['range']))
              .month
              .toString() +
          '/' +
          data1
              .add(Duration(days: vaccinesDetails[index]['range']))
              .year
              .toString(),
      vaccineNames: vaccinesDetails[index]['names'],
    );
  });
}

List vaccinesDetails = [
  {
    'Header': 'At Birth',
    'range': 0,
    'names': [
      '1)BCG',
      '2)b oral polio vaccine (bOPV)-o',
      '3)hepatitis B birth dose',
    ],
  },
  {
    'Header': '1 ½ months',
    'range': 45,
    'names': [
      '1)f inactivated poliovirus vaccine (Fipv)-1',
      '2) pneumococcal conjugate vaccine (PCV-1)',
      '3)Haemophilus influenzae type b vaccine -1 ',
      '4)Diphtheria. Pertussis & tetanus vaccine -1',
      '5)Hepatitis B vaccine -1',
      '6)b oral polio vaccine (bOPV)-1',
      '7)Rotavirus',
    ],
  },
  {
    'Header': '2 ½  months',
    'range': 105,
    'names': [
      '1) b Oral polio vaccine ( bOPV)-3',
      '2) Rotavirus-3',
      '3) pneumococcal conjugate vaccine ( PCV-3)',
      '4) Hepatitis B vaccine -3',
      '5) Diphtheria. Pertussis & Tetanus vaccine -3',
      '6) Haemophilus influenzae type b vaccine-3',
      '7) f inactivated poliovirus vaccine (fIPV)',
    ],
  },
  {
    'Header': '9 months',
    'range': 270,
    'names': [
      '1) Japanese encephalitis',
      '2)	Pneumococcal conjugate vaccine (PCV) Booster',
    ],
  },
  {
    'Header': '18 months',
    'range': 18 * 30,
    'names': [
      '1)Diphtheria. Pertussis & Tetanus (DPT) Booster',
      '2)B Oral polio vaccine (bOPV) Booster',
      '3)Measles Rubella -2',
      '4)Vitamin A',
    ],
  },
  {
    'Header': '5 years',
    'range': 5 * 12 * 30,
    'names': ['5 years'],
  },
  {
    'Header': 'Additional vaccines',
    'range': 0,
    'names': [
      '1)	Vitamin A',
      '2)	Hepatitis A vaccine',
      '3)	Typhoid vaccine',
      '4)	Varicella vaccine',
    ],
  }
];

Widget loadingDialog() {
  return Dialog(
      child: new Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 30,
      ),
      new CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
      SizedBox(
        height: 30,
      ),
      new Text("Loading"),
      SizedBox(
        height: 30,
      ),
    ],
  ));
}
