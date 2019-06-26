import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPageC(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('gambar/images.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}

class LoginPageC extends StatefulWidget {
  @override
  _LoginPageCState createState() => _LoginPageCState();
}

class _LoginPageCState extends State<LoginPageC> {
  final _formkey = GlobalKey<FormState>();
  bool _validasi = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Form(
        key: _formkey,
        autovalidate: _validasi,
        
        child: SingleChildScrollView(
          child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'gambar/flutter.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Flutter Login',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: validasiEmail,
                    onSaved: (String val) {
                      email = val;
                    }),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: validasiNama,
                    onSaved: (String val) {
                      password = val;
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                      textColor: Colors.amber,
                      color: Colors.lightBlue,
                      child: Text('Login'),
                      onPressed: validasiInputan),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Already have an account'),
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text('Facebook'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        Toast.show("Comming Soon",context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }

  String validasiEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  String validasiNama(String pass) {
    if (pass.length < 8) {
      return 'Password minimal 8 karakter';
    } else {
      return null;
    }
  }

  void validasiInputan() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("data complete")));
      Toast.show("Data Complete", context, duration: Toast.LENGTH_LONG);
    } else {
      setState(() {
        _validasi = true;
      });
    }
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//       Toast.show("Angka : $_counter", context,
//           duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//         actions: <Widget>[],
//       ),
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             Image.asset('gambar/gambar.jpg'),
//             RaisedButton(
//               onPressed: () {},
//               child: Text('button 1'),
//             ),
//             RaisedButton(
//               child: Text('button 2'), onPressed: () {},
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
