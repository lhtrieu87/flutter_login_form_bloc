// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_form_bloc/src/app.dart';

void main() {
  testWidgets('Submit valid email & password', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.enterText(find.byKey(new Key("emailField")), "abc@cba.com");
    await tester.pump();

    await tester.enterText(
        find.byKey(new Key("passwordField")), "123456QWERTy");
    await tester.pump();

    await tester.tap(find.byKey(new Key("loginButton")));
    await tester.pump();

    await tester.pump();
    expect(find.text('You are logged in.'), findsOneWidget);
  });

  testWidgets('Invalid email', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.enterText(find.byKey(new Key("emailField")), "invalid email");
    await tester.pump();

    expect(find.text('Please enter a valid email address'), findsOneWidget);

    await tester.tap(find.byKey(new Key("loginButton")));
    await tester.pump();

    await tester.pump();
    expect(find.text('You are logged in.'), findsNothing);
  });

  testWidgets('Invalid password', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.enterText(
        find.byKey(new Key("passwordField")), "invalid password");
    await tester.pump();

    expect(
        find.text(
            'Password contains six characters or more and has at least one lowercase and one uppercase alphabetical character or has at least one lowercase and one numeric character or has at least one uppercase and one numeric character.'),
        findsOneWidget);

    await tester.tap(find.byKey(new Key("loginButton")));
    await tester.pump();

    await tester.pump();
    expect(find.text('You are logged in.'), findsNothing);
  });
}
