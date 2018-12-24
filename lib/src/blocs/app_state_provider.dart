import 'package:flutter/widgets.dart';
import 'package:login_form_bloc/src/blocs/state_mgmt_bloc.dart';

class AppStateProvider extends InheritedWidget {
  final stateManagementBloc = StateManagementBloc();

  AppStateProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static StateManagementBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppStateProvider)
            as AppStateProvider)
        .stateManagementBloc;
  }
}
