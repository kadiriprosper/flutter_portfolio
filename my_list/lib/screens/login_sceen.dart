import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    CustomAppBar customAppBar = const CustomAppBar(label: 'Login');
    return Scaffold(
      appBar: customAppBar.build(context),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            //padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(20),
            height: 250,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Hero(
                          tag: logoID,
                          child: Icon(
                            CupertinoIcons.pencil_outline,
                            color: Colors.blue,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Author\'s name',
                          textAlign: TextAlign.center,
                          style: textStyle1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: nameController,
                    onChanged: (value) {
                      username = value;
                    },
                    decoration: inputDesign1.copyWith(
                        label: const Text('author\'s name')),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  onPressed: () async{
                    if (username != null && username!.length > 1) {
                      Provider.of<Tasks>(context, listen: false)
                          .setUsername(username!);
                      username = null;
                      nameController.clear();
                      Navigator.of(context).popAndPushNamed(mainPage);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Username is empty'),
                        ),
                      );
                    }
                  },
                  height: 50,
                  color: Colors.blue,
                  elevation: 5,
                  splashColor: Colors.lightBlueAccent,
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
