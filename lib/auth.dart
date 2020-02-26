import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:ride/app.dart';
import 'package:ride/global.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoadingNextScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(physics: BouncingScrollPhysics(), children: [
              Form(
                key: formKey,
                child: AnimatedContainer(
                  duration: Duration(seconds: 3),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 90.0, bottom: 10),
                          child: Image.asset(
                            "assets/ride_logo.png",
                            height: 100,
                          ),
                        ),
//                  PageTransitionSwitcher(
//                    transitionBuilder: (Widget child,
//                            Animation<double> animation,
//                            Animation<double> secondaryAnimation) =>
//                        SharedAxisTransition(
//                      animation: animation,
//                      secondaryAnimation: secondaryAnimation,
//                      transitionType: SharedAxisTransitionType.horizontal,
//                      child: child,
//                    ),
//                    child: (Global.wantToRegister)
//                        ? Register()
//                        : Login(),
//                  ),

                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: (Global.wantToRegister)
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 10),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    validator: (v) => (v.isEmpty)
                                        ? "please enter your name"
                                        : null,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: InputDecoration(
                                        labelText: 'full name',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15),
                                                topLeft: Radius.circular(15)))),
                                  ),
                                )
                              : Container(
                                  height: 80,
                                  width: 0,
                                ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (v) =>
                                (v.isEmpty) ? "pleae enter your email" : null,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                labelText: 'email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(15)))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 10),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            validator: (v) => (v.isEmpty)
                                ? "please enter your password"
                                : (v.length < 6)
                                    ? "password must be at least 6 characters"
                                    : null,
                            obscureText: true,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye,
                                    color: Colors.white70),
                                labelText: 'password',
//                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        topLeft: Radius.circular(15)))),
                          ),
                        ),
                        AnimatedSwitcher(
                          child: (Global.wantToRegister)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 28,
                                    width: 0,
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: FlatButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: Text(
                                          "Forgot password?",
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                  ),
                                ),
                          duration: Duration(milliseconds: 300),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: RaisedButton(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  setState(() {
                                    isLoadingNextScreen = true;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AppMain()));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  (Global.wantToRegister)
                                      ? "REGISTER"
                                      : "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15))),
                              onPressed: () {
                                setState(() {
                                  Global.wantToRegister =
                                      !Global.wantToRegister;
                                });
                              },
                              child: Text(
                                  (Global.wantToRegister)
                                      ? "Already have an account? Login "
                                      : "New to Ride? Register",
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(
                height: (isLoadingNextScreen) ? 3 : 0,
                child: LinearProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
//
//class Login extends StatelessWidget {
//
//  final GlobalKey<FormState> formKey;
//  final TextEditingController emailController;
//  final TextEditingController passwordController;
//
//  Login({@required this.formKey, @required this.emailController, @required this.passwordController});
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.only(
//              top: 50,
//              left: 10,
//              right: 10,
//              bottom: 10),
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            validator: (v) =>
//            (v.isEmpty) ? "pleae enter your email" : null,
//            cursorColor: Theme.of(context).primaryColor,
//            decoration: InputDecoration(
//                labelText: 'email',
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(15),
//                        topLeft: Radius.circular(15)))),
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.only(
//              top: 10, left: 10, right: 10, bottom: 10),
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            validator: (v) => (v.isEmpty)
//                ? "please enter your password"
//                : (v.length < 6)
//                ? "password must be at least 6 characters"
//                : null,
//            obscureText: true,
//            cursorColor: Theme.of(context).primaryColor,
//            decoration: InputDecoration(
//                suffixIcon:
//                Icon(Icons.remove_red_eye, color: Colors.white70),
//                labelText: 'password',
////                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
//
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(15),
//                        topLeft: Radius.circular(15)))),
//          ),
//        ),
//
//            Align(
//          alignment: Alignment.topRight,
//          child: Padding(
//            padding: const EdgeInsets.only(right: 16.0),
//            child: FlatButton(
//                onPressed: () {},
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(15),
//                        bottomRight: Radius.circular(15))),
//                child: Text(
//                  "Forgot password?",
//                  style: TextStyle(color: Colors.grey),
//                )),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16.0),
//          child: RaisedButton(
//              elevation: 8,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(15),
//                      bottomRight: Radius.circular(15))),
//              onPressed: () {
//                if (formKey.currentState.validate()) {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (_) => AppMain()));
//                }
//              },
//              child: Padding(
//                padding: const EdgeInsets.all(12.0),
//                child: Text(
//                   "LOGIN",
//                  style: TextStyle(color: Colors.white, fontSize: 25),
//                ),
//              ),
//              color: Theme.of(context).primaryColor),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(
//              horizontal: 16.0, vertical: 8),
//          child: FlatButton(
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(15),
//                      bottomRight: Radius.circular(15))),
//              onPressed: () {
//
//                  Global.wantToRegister = !Global.wantToRegister;
//
//              },
//              child: Text(
//                     "New to Ride? Register",
//                  style: TextStyle(
//                      color: Colors.grey.shade600, fontSize: 14))),
//        )
//
//
//      ],
//    );
//  }
//}
//
//class Register extends StatelessWidget {
//
//  final GlobalKey<FormState> formKey;
//  final TextEditingController fullnameController;
//  final TextEditingController emailController;
//  final TextEditingController passwordController;
//
//
//  Register({@required this.formKey, @required this.nameController, @required this.emailController, @required this.passwordController})
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.only(
//              top: 40, left: 10, right: 10, bottom: 10),
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            validator: (v) =>
//            (v.isEmpty) ? "please enter your name" : null,
//            cursorColor: Theme.of(context).primaryColor,
//            decoration: InputDecoration(
//                labelText: 'full name',
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(15),
//                        topLeft: Radius.circular(15)))),
//          ),
//        ),
//
//        Padding(
//          padding: EdgeInsets.only(
//              top: 10 ,
//              left: 10,
//              right: 10,
//              bottom: 10),
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            validator: (v) =>
//            (v.isEmpty) ? "pleae enter your email" : null,
//            cursorColor: Theme.of(context).primaryColor,
//            decoration: InputDecoration(
//                labelText: 'email',
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(15),
//                        topLeft: Radius.circular(15)))),
//          ),
//        ),
//        Padding(
//          padding: EdgeInsets.only(
//              top: 10, left: 10, right: 10, bottom: 10),
//          child: TextFormField(
//            style: TextStyle(color: Colors.white),
//            validator: (v) => (v.isEmpty)
//                ? "please enter your password"
//                : (v.length < 6)
//                ? "password must be at least 6 characters"
//                : null,
//            obscureText: true,
//            cursorColor: Theme.of(context).primaryColor,
//            decoration: InputDecoration(
//                suffixIcon:
//                Icon(Icons.remove_red_eye, color: Colors.white70),
//                labelText: 'password',
////                          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
//
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.only(
//                        bottomRight: Radius.circular(15),
//                        topLeft: Radius.circular(15)))),
//          ),
//        ),
//
//             Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Container(
//            height: 0,
//            width: 0,
//          ),
//        )
//
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16.0),
//          child: RaisedButton(
//              elevation: 8,
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(15),
//                      bottomRight: Radius.circular(15))),
//              onPressed: () {
//                if (formKey.currentState.validate()) {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (_) => AppMain()));
//                }
//              },
//              child: Padding(
//                padding: const EdgeInsets.all(12.0),
//                child: Text(
//                  (widget.wantRegister) ? "REGISTER" : "LOGIN",
//                  style: TextStyle(color: Colors.white, fontSize: 25),
//                ),
//              ),
//              color: Theme.of(context).primaryColor),
//        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(
//              horizontal: 16.0, vertical: 8),
//          child: FlatButton(
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(15),
//                      bottomRight: Radius.circular(15))),
//              onPressed: () {
//                setState(() {
//                  widget.wantRegister = !widget.wantRegister;
//                });
//              },
//              child: Text(
//                  (widget.wantRegister)
//                      ? "Already have an account? Login "
//                      : "New to Ride? Register",
//                  style: TextStyle(
//                      color: Colors.grey.shade600, fontSize: 14))),
//        )
//      ],
//    );
//  }
//}
