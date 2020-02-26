import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 25, left: 0, bottom: 8),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Options",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70),
            ),
          ),
          const SizedBox(
            height: 400,
            child: Center(child: Text("Options will be listed here")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 19, right: 20, left: 20),
            child: RaisedButton(
              elevation: 4,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "CALL RIDE BUS",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
