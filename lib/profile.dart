import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        padding: EdgeInsets.all(8),
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
          Card(
            color: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.account_circle, size: 50),
                    title: Text(
                      "Emmanuel Sunday",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text("nuel.mailbox@gmail.com"),
                  ),
                ),
                Divider(
                  color: Theme.of(context).accentColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 12, top: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.directions_bus),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: RichText(
                          text: TextSpan(
                              text: "3 ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 17),
                              children: <InlineSpan>[
                                TextSpan(
                                    text: "pickups this month",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            title: Text(
              "Monthly Subscripton -- Active",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "Expires March 14, 2020",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          Divider(color: Theme.of(context).primaryColor.withOpacity(0.4)),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: Theme.of(context).primaryColor.withOpacity(1),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
          Divider(color: Theme.of(context).primaryColor.withOpacity(0.4)),
        ],
      ),
    );
  }
}
