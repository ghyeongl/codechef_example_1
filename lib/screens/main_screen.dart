import 'package:codechef_example_1/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSignupScreen extends StatefulWidget {
  LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        // Note: Stack refers how to position children:
        // Note: stacking in front of any child
        child: Stack(
          children: [
            // background image and title
            // Note: Positioned only works in Stack widget
            // Note: Positioned specifies its position which top, left, etc
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/red.jpg'), fit: BoxFit.fill),
                ),
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
            // Login and signup box
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
            // Right arrow button
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
            // google sign in menu
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
