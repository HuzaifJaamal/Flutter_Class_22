import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewState extends StatefulWidget {
  const LoginViewState({super.key});

  @override
  State<LoginViewState> createState() => _LoginViewStateState();
}

class _LoginViewStateState extends State<LoginViewState> {
  String isLogin = "User not Login";
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;

  @override
  // Note: We don't make the init function to the "async"
  void initState(){
    super.initState();
    fetchInitialData();
  }

  login() async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isLogin = "User logged in";
    // Save an integer value to 'counter' key.
    await prefs.setString('isLogin', isLogin);

    setState(() {});
  }

  fetchInitialData()async{
    await getLoggedInState();
  }

  getLoggedInState()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    isLogin = prefs.getString('isLogin') ?? isLogin;
    setState(() {});
  }

  singOut () async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // When use the clear method so it remove all thing in the local storage.
    await prefs.clear();
    /* // When use the remove method so its remove the particular key.
    await prefs.remove('isLogin'); */

  }

  updateData()async{
    counter1++;
    counter2++;
    // The Set State update all functionality that before the set state.
    // We put only that functionality in between Barkets {} that update depends on this.
    setState(() {  });
    await Future.delayed(Duration(milliseconds: 100));
    counter3++;

  }

  fetchData() async{
    print('Hello 1');
    await Future.delayed(Duration(seconds: 2));
    print("Hello 2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(isLogin),
            Text(counter1.toString()),
            Text(counter2.toString()),
            Text(counter3.toString()),
            ElevatedButton(
              onPressed: (){
                fetchData();
                updateData();
                login();
              },
              child: Text('Fetch'),
              ),
          ],
        ),
      ),
    );
  }
}