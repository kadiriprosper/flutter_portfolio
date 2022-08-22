import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_list/components/custom_appbar.dart';
import 'package:my_list/constants/constants.dart';
import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
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
    CustomAppBar customAppBar = const CustomAppBar(label: 'Welcome');
    return Scaffold(
      appBar: customAppBar.build(context),
      body: Center(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Hero(
                      tag: logoID,
                      child: Icon(
                        CupertinoIcons.pencil_outline,
                        color: Colors.blue,
                        size: 60,
                      ),
                    ),
                    Text(
                      'Hello There!',
                      style: textStyle1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                height: 50,
                onPressed: () {
                  Navigator.of(context).popAndPushNamed(loginPage);
                },
                color: Colors.blue,
                elevation: 5,
                splashColor: Colors.lightBlueAccent,
                child: Center(
                  child: Text(
                    'Continue',
                    style: textStyle1.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
