import 'package:flutter/material.dart';

import 'package:my_list/services/tasks_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.label,
      this.splashColor,
      this.backEnabled = true,
      this.leading})
      : super(key: key);

  final String label;
  final Color? splashColor;
  final bool backEnabled;
  final Widget? leading;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: backEnabled,
      title: Text(label),
      shadowColor: splashColor ?? Colors.lightBlueAccent,
      backgroundColor: Provider.of<Tasks>(context).appBarColor,
      elevation: 10,
      centerTitle: true,
      actions: [
        InkWell(
          enableFeedback: false,
          onTap: () {
            Provider.of<Tasks>(context, listen: false).setTheme();
          },
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Provider.of<Tasks>(context).bgColor,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Provider.of<Tasks>(context).fgColor,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
