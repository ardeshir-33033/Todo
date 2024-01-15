import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_list/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tests if we can load successful data and todo list',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('TodoList')), findsOneWidget);
    });
  });
}
