import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMIcalc(),
    );
  }
}

//Stateful Widget
class BMIcalc extends StatefulWidget {
  BMIcalc({Key key}) : super(key: key);
  @override
  _BMIcalcState createState() => _BMIcalcState();
}

class _BMIcalcState extends State<BMIcalc> {
  int currindex = 0;
  String result = "";
  double h, w;
  TextEditingController bmicontrol = TextEditingController();
  TextEditingController heightcontrol = TextEditingController();
  TextEditingController weightcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pink, 1)
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  "Your height in Cms: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  controller: heightcontrol,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter height",
                    suffixIcon: IconButton(
                      onPressed: heightcontrol.clear,
                      icon: Icon(Icons.clear),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Weight in kgs: ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  controller: weightcontrol,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter weight",
                    suffixIcon: IconButton(
                      onPressed: weightcontrol.clear,
                      icon: Icon(Icons.clear),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        h = double.parse(heightcontrol.value.text);
                        w = double.parse(weightcontrol.value.text);
                      });
                      calc(h, w);
                    },
                    color: Colors.blue,
                    child: Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Your BMI is: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calc(double height, double weight) {
    double res = weight / (height * height / 10000);
    String bmi = res.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        // ignore: deprecated_member_use
        child: FlatButton(
          color: currindex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currindex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
