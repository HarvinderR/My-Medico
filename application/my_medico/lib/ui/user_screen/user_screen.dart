import 'package:flutter/material.dart';
import 'package:my_medico/model/user.dart';

class UserScreen extends StatelessWidget {
  static const String rnLoginScreen = '/UserScreen';
  const UserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  // final User user;
  _Body();

  Widget showUser(User user) {
    print("user $user");
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name"),
                    Text(user.name),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Username"),
                    Text(user.username),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email"),
                    Text(user.email),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address"),
                    Text(user.address),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: User.fetchUserFromSharedPref(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return showUser(snapshot.data);
        }
        return Container();
      },
    );
  }
}
