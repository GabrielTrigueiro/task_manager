import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/tests/MyWidget.dart';

main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    //usando findsOneWidget para verificar se os textos aparecem como o esperado
    //obs:
    // findsNothing - Verifies that no widgets are found.
    // findsWidgets - Verifies that one or more widgets are found.
    // findsNWidgets - Verifies that a specific number of widgets are found.
    // matchesGoldenFile - Verifies that a widget’s rendering matches a particular bitmap image (“golden file” testing).

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
