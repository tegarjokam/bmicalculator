import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController weightCtrl = TextEditingController();

  var bmiResult;
  var consideredResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text("Height"),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20, left: 10),
                    child: TextField(
                      controller: heightCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-',
                        suffix: Text("cm"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text("Weight"),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: weightCtrl,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "-",
                            suffix: Text("kg"),
                          ),
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      print(bmiResult);
                      print(heightCtrl.text.length == 0);
                      if (heightCtrl.text.length != 0 ||
                          weightCtrl.text.length != 0) {
                        var height = int.parse(heightCtrl.text);
                        var weight = int.parse(weightCtrl.text);
                        var result =
                            weight / ((height * 0.01) * (height * 0.01));
                        if (result < 17.0)
                          consideredResult = "severely underweight";
                        else if (result > 17.0 && result <= 18.4)
                          consideredResult = "underweight";
                        else if (result > 18.4 && result <= 25.0)
                          consideredResult = "normal";
                        else if (result > 25.0 && result <= 27.0)
                          consideredResult = "overweight";
                        else if (result > 27.0) consideredResult = "obese";
                        bmiResult =
                            "Your Body Mass Index is ${result.roundToDouble()}. This is considered ${consideredResult}";
                        print(bmiResult);
                      } else {
                        bmiResult = "Please, fill the blank";
                      }
                    });
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          bmiResult == null
              ? Container()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heightCtrl.clear();
            weightCtrl.clear();
            bmiResult = null;
          });
        },
        tooltip: 'reset all field',
        child: Text("Reset"),
      ),
    );
  }
}
