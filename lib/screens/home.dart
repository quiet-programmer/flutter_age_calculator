import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double _age = 0.0;
  var _selectedYear;
  var _currentYear;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((DateTime date) {
      setState(() {
        _selectedYear = date.year;
        _calculateAge();
      });

      print(_selectedYear);
    });
  }

  void _calculateAge() {
    // DateTime dateY;
    // var date = dateY.year;
    // _currentYear;
    setState(() {
      _age = (2020 - _selectedYear).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculate"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                child: Text(
                  _selectedYear != null
                      ? _selectedYear.toString()
                      : "Select your Year of Birth Please",
                ),
                color: Colors.pinkAccent,
                borderSide: BorderSide(color: Colors.black, width: 1.0),
                onPressed: _showPicker,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Text(
                "Your Age is ${_age.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
