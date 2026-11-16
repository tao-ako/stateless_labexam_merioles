import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_dashboard_app/student_dashboard_app.dart';

void main() {
  testWidgets('dashboard displays the student and subject information', (
    tester,
  ) async {
    await tester.pumpWidget(const StudentDashboardApp());

    expect(find.text('Student Dashboard'), findsOneWidget);
    expect(find.text('Kevin Loyd T. Merioles'), findsOneWidget);
    expect(find.text('537327'), findsOneWidget);
    expect(find.text('k.merioles.537327@umindanao.edu.ph'), findsOneWidget);
    expect(find.text('Subjects'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Database Systems'), findsOneWidget);
    expect(find.text('Operating Systems'), findsOneWidget);
  });

  testWidgets('editing the profile updates the dashboard', (tester) async {
    await tester.pumpWidget(const StudentDashboardApp());
    await tester.tap(find.byTooltip('Edit profile'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).first, 'Kevin Merioles');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Kevin Merioles'), findsOneWidget);
    expect(find.text('Kevin Loyd T. Merioles'), findsNothing);
  });

  testWidgets('logout opens a confirmation dialog', (tester) async {
    await tester.pumpWidget(const StudentDashboardApp());
    await tester.tap(find.byTooltip('Log out'));
    await tester.pumpAndSettle();

    expect(find.text('Are you sure you want to log out?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Log out'), findsOneWidget);
  });

  testWidgets('dashboard remains usable on a compact portrait screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentDashboardApp());
    expect(tester.takeException(), isNull);

    await tester.drag(find.byType(ListView), const Offset(0, -500));
    await tester.pumpAndSettle();

    expect(find.text('Operating Systems'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
