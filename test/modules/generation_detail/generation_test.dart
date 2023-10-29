import 'dart:io';

import 'package:esensi_solusi_buana_test/modules/generation_detail/generation_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../helpers/hydrated_bloc.dart';
import '../../helpers/injection.dart';

void main() {
  initHydratedStorage();
  injectionUnit();

  setUpAll(() {
    // ↓ required to avoid HTTP error 400 mocked returns
    HttpOverrides.global = null;
  });

  group('Generation Detail', () {
    testWidgets('renders generation detail view', (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: GoRouter(routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const GenerationDetailPage(
                name: 'a',
                url: 'url',
              ),
            )
          ]),
        ),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(GenerationDetailView), findsOneWidget);
    });
  });
}
