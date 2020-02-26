import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ride/mapview.dart';
import 'package:ride/options.dart';
import 'package:ride/profile.dart';

class AppMain extends StatefulWidget {
  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: <Widget>[
            MapSample(),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: OpenContainer(
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    closedBuilder: (context, _) {
                      return Icon(
                        Icons.account_circle,
                        color: Theme.of(context).accentColor,
                        size: 35,
                      );
                    },
                    openBuilder: (context, _) => Profile()),
              ),
            ),
            Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor.withAlpha(100),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Ride Bus is offline",
                        style: TextStyle(color: Colors.white),
                      ),
                    )))
          ],
        ),
        floatingActionButton: _OpenContainerWrapper(
            transitionType: ContainerTransitionType.fade,
            open: Options(),
            closedBuilder: (BuildContext _, VoidCallback openContainer) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.menu, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Options",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.open,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final Widget open;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Theme.of(context).accentColor,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return open;
      },
      tappable: true,
      transitionDuration: Duration(milliseconds: 500),
      closedBuilder: closedBuilder,
    );
  }
}
