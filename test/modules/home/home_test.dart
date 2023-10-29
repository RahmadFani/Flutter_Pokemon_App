import 'dart:io';

import 'package:esensi_solusi_buana_test/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injection.dart';

void main() {
  initHydratedStorage();
  injectionUnit();

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Home', () {
    testWidgets('renders Home View', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('On Tab Explore Clicked', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('_buttonTabExplore')));
    });

    testWidgets('On Tab Favorite Clicked', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.byKey(const Key('_buttonTabFavorite')));
    });
  });
}
