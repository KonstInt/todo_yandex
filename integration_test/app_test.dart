import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'test_main.dart' as test_app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('initialize test', (widgetTester) async {
    test_app.main();
    await widgetTester.pumpAndSettle();
    expect(find.byIcon(Icons.add).last, findsWidgets);

    await Future.delayed(const Duration(seconds: 2));
    await widgetTester.tap(find.byIcon(Icons.add).last);
    await widgetTester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));
    expect(find.byIcon(Icons.close).last, findsWidgets);
    await widgetTester.enterText(
        find.byType(TextField).first, "Integration Test");
    try {
      await widgetTester.tap(find.text("СОХРАНИТЬ"));
    } catch (e) {
      await widgetTester.tap(find.text("SAVE"));
    }

    await widgetTester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    expect(find.text("Integration Test"), findsWidgets);
  });
}
