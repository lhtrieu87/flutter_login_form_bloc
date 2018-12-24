import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_form_bloc/src/blocs/app_state_provider.dart';
import 'package:login_form_bloc/src/blocs/state_mgmt_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppStateProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            buildText(bloc),
          ],
        ),
      ),
    );
  }

  Widget buildText(StateManagementBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Text('You are logged in.');
      },
    );
  }
}
