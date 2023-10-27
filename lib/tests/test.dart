import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/tests/MyWidget.dart';

main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (tester) async {
    //crio o widget que quero testar aqui dentro e passo seus parametros utilizando pumpWidget()
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
  });
}
