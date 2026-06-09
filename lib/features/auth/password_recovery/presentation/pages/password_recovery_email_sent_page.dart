import 'package:adhd_app/shared/design_system/widgets/ds_button/ds_button.dart';
import 'package:adhd_app/shared/design_system/widgets/ds_scaffold/ds_scaffold.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DsScaffold(
      children: [
        Text("Check yout email!"),
        Text(
          "If an account is linked to that email, you will receive a link to reset your password.",
        ),
        // TODO - implement this functionality
        // DsButton.textAndLink(
        //   onPressed: () {},
        //   label: "Having trouble resetting your password?",
        //   linkLabel: "Contact an admin!",
        // ),
      ],
    );
  }
}
