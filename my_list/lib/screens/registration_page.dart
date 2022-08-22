import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? username;
  String? password;
  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomAppBar customAppBar = const CustomAppBar(label: 'Register');
    return Scaffold(
      appBar: customAppBar.build(context),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            height: 300,
            width: 250,
            decoration: BoxDecoration(
              color: Provider.of<Tasks>(context).containerColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.lightBlueAccent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Hero(
                      tag: logoID,
                      child: Icon(
                        CupertinoIcons.pencil_outline,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register',
                      style: textStyle1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  controller: nameController,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration:
                      inputDesign1.copyWith(label: const Text('username')),
                ),
                const SizedBox(height: 2),
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  controller: passController,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      inputDesign1.copyWith(label: const Text('password')),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: MaterialButton(
                    onPressed: () {
                      if (username != null &&
                          username!.length > 1 &&
                          password != null &&
                          password!.length > 1) {
                        Provider.of<Tasks>(context, listen: false)
                            .setUsername(username!);
                        username = null;
                        nameController.clear();
                        passController.clear();
                        Navigator.of(context).popAndPushNamed(mainPage);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Username is empty'),
                          ),
                        );
                      }
                    },
                    color: Colors.blue,
                    elevation: 5,
                    splashColor: Colors.lightBlueAccent,
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
