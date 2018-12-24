import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_form_bloc/src/blocs/app_state_provider.dart';
import 'package:login_form_bloc/src/blocs/state_mgmt_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateManagementBloc = AppStateProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('State Mgmt. Inherited Widgets Demo'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            emailField(stateManagementBloc),
            SizedBox(height: 10.0),
            passwordField(stateManagementBloc),
            SizedBox(
              height: 40.0,
            ),
            loginButton(stateManagementBloc),
          ],
        ),
      ),
    );
  }

  emailField(StateManagementBloc stateManagementBloc) {
    return StreamBuilder(
      stream: stateManagementBloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: stateManagementBloc.updateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'email@xyz.com',
              labelText: 'Email Address',
              errorText: snapshot.error),
        );
      },
    );
  }

  passwordField(StateManagementBloc stateManagementBloc) {
    return StreamBuilder(
      stream: stateManagementBloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return TextField(
          onChanged: stateManagementBloc.updatePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Enter Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  loginButton(StateManagementBloc stateManagementBloc) {
    return StreamBuilder(
      stream: stateManagementBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData
              ? () => Navigator.pushNamed(context, '/home')
              : null,
        );
      },
    );
  }
}
