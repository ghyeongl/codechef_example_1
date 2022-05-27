import 'package:codechef_example_1/config/palette.dart';
import 'package:flutter/material.dart';

// Note: Widget class is generally immutable(not change)
// but stateful widget should apply change by state changed
// LoginSignupScreen class which inheritances StatefulWidget also immutable
// **
// Note: When we should use StatefulWidget?
// changes its state (internal state)
// New data are arrival by constructor of child widget. e.g. new Scaffold(blah blah(changing))
// **
// Note: How can we change StatefulWidget's state?
// use setState() Method; it rebuilds widget rather than manual
//
//
// **
// Overview: StatefulWidget of LoginSignupScreen
// Grammar: inheritance from StatefulWidget makes compatible to \
// generic type of State superclass
class LoginSignupScreen extends StatefulWidget {
  // **
  // Overview: "key" makes each object special
  // Grammar: "?" is used when Declaring Null (Null safety)
  // ":" works as initialize function on constructor function
  // Note: Constructor function on java = new function();
  // super calls constructor of mother class (in case, StatefulWidget)
  // it initializes key; from superclass of StatefulWidget - Widget
  // it makes each object has special key; to verify and for swap
  LoginSignupScreen({Key? key}) : super(key: key);
  // **
  // Overview: call "createState()" when change needed
  // Grammar: return type of createState Method is State<LoginSignupScreen>
  // "=>" means return
  // it defines createState() method of StatefulWidget
  // when widget rebuilds, StatefulWidget just returns createState() method
  // stateless widget returns all things on build method directly unlike StatefulWidget
  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

// **
// Overview: Mutable class of StatefulWidget "LoginSignupScreen"
// Grammar: this private class extends State<StatefulWidget>,
// get LoginSignupScreen class from top of code and
// make it generic type of State.
// Note: this class is mutable instead of LoginSignupScreen widget
class _LoginSignupScreenState extends State<LoginSignupScreen> {
  // Setting a variable
  bool isSignupScreen = true;
  // **
  // Overview: All contents about LoginSignupScreenState state
  // because of state's generic type always inheritances StatefulWidget,
  // build overrides the method of state<LoginSignupScreen> class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // **
      // Overview: All objects in SafeArea
      body: SafeArea(
        // Note: Stack refers how to position children:
        // Note: stacking in front of any child
        // When child widget is changing its state, it should be stateful widget
        child: Stack(
          children: [
            // **
            // Overview: "red.jpg" & "Yummy chat" background image & title
            // Note: Positioned only works in Stack widget
            // Note: Positioned specifies its position which top, left, etc
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                // Overview: "red.jpg"
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/red.jpg'), fit: BoxFit.fill),
                ),
                // **
                // Overview: title "Welcome" + "to yummy chat" or "back"
                // Makes padding, and contains its text style in children
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? ' to Yummy chat!' : ' back',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ]
                        )
                      ),
                      Text(
                        isSignupScreen ? 'Signup to continue': 'Sign in to continue',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white
                        )
                      )
                    ],
                  ),
                )
              ),
            ),
            // **
            // Overview: "Login" & "Signup" tab and it's box
            AnimatedPositioned(
              // Margin to 180 from top
              top: 180,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              // Container of child: round rectangle and another child contents
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                // add inner padding to all edges: 20
                padding: const EdgeInsets.all(20.0),
                // set height of initial rectangle
                height: isSignupScreen ? 280.0 : 250.0,
                // to set width responsible, get size of actual phone width by MediaQuery
                width: MediaQuery.of(context).size.width - 40,
                // add outer margin to align box to center
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                // add box decoration white, round, shadow
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  // boxShadow makes shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5
                    )
                  ]
                ),
                // make a child on the field that these settings above
                // Child of Container : Login and Signup
                // Note: child: %ClassHere% refers how to set elements' direction
                child: Column(
                  // Note: Column Aligns children vertically
                  children: [
                    // Top of Login and Signup
                    // Note: Row aligns elements horizontal
                    Row(
                      // Note: Alignment parameter of Row class, Align to width of Column
                      // Note: spaceAround : Make center space as twice than beside of objects
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // Note: children of Row class. Two GestureDetectors
                      // Note: Two children acts it's element of Row
                      children: [
                        // Login_Text group and it's action
                        GestureDetector(
                          // Action: make "isSignupScreen" False when tap
                          onTap: (){
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          // Group: Login and bar
                          child: Column(
                            children: [
                              // Content: Login
                              Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignupScreen ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              // Content: Bar under the Login Text
                              if(!isSignupScreen) // Note: inline if (from Dart 2.3)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        // Signup_Text group and it's action
                        GestureDetector(
                          // Action: set isSignupScreen true when tap
                          onTap: (){
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          // Group: Signup Text and bar
                          child: Column(
                            children: [
                              // Content: "Signup" Text and style
                              Text( // First args: text, Second args: style
                                'SIGNUP',
                                style: TextStyle( // Apply TextStyle Method to style
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    // Action: Make color active when isSignupScreen is true
                                    color: isSignupScreen ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              // Content: bar under text
                              if(isSignupScreen)
                              Container(
                                // make margin(Edge) only on top
                                margin: const EdgeInsets.only(top: 3),
                                // info of actual rectangle is
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Middle of Login and Signup
                    //
                    if(isSignupScreen)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Form(
                        child: Column(
                          children: [
                            // Text form field which gets username
                            TextFormField(
                              // Decoration - Icon, border, etc of Text form field
                              // Note: InputDecoration is Class for decorating TextFormField
                              decoration: const InputDecoration(
                                // Decorate prefix part
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor
                                ),
                                // decorate border when not clicked
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1
                                  ),
                                  // set border radius from initial box
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0)
                                  )
                                ),
                                // decorate border when clicked
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Palette.textColor1
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0)
                                  )
                                ),
                                // set Hint text
                                hintText: 'User name',
                                // set text style of hint text
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Palette.textColor1
                                ),
                                // set inner padding from Edge
                                contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                            // set invisible box which have height of 8
                            const SizedBox(
                              height: 8,
                            ),
                            // Another text form field
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                            // Another sized box
                            const SizedBox(
                              height: 8,
                            ),
                            // Another text form field
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(35.0)
                                      )
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Palette.textColor1
                                  ),
                                  contentPadding: EdgeInsets.all(10)
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                    if(!isSignupScreen)
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Form(
                          child: Column(
                            children: [
                              // Text form field which gets username
                              TextFormField(
                                // Decoration - Icon, border, etc of Text form field
                                // Note: InputDecoration is Class for decorating TextFormField
                                decoration: const InputDecoration(
                                  // Decorate prefix part
                                    prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor
                                    ),
                                    // decorate border when not clicked
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1
                                        ),
                                        // set border radius from initial box
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)
                                        )
                                    ),
                                    // decorate border when clicked
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)
                                        )
                                    ),
                                    // set Hint text
                                    hintText: 'User name',
                                    // set text style of hint text
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    // set inner padding from Edge
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                              // set invisible box which have height of 8
                              const SizedBox(
                                height: 8,
                              ),
                              // Another text form field
                              TextFormField(
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                        Icons.account_circle,
                                        color: Palette.iconColor
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)
                                        )
                                    ),
                                    hintText: 'User name',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    // Bottom of Login and Signup

                  ],
                )
              ),
            ),
            // **
            // Overview: "Right arrow" apply button
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              top: isSignupScreen ? 430 : 390,
              right: 0,
              left: 0,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.red
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1)
                        )
                      ]
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            // **
            // Overview: "Sign up with google" box
            Positioned(
              top: MediaQuery.of(context).size.height - 200,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(isSignupScreen ? 'or Signup with' : 'or Sign in with'),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton.icon(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: Palette.googleColor
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
