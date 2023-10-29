import 'dart:io';

import 'package:esensi_solusi_buana_test/modules/app/view/app.dart';
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

  group('App', () {
    testWidgets('renders app view', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          const App(),
        );
        await tester.pumpAndSettle();
        expect(find.byType(AppView), findsOneWidget);
      });
    });
  });
}
