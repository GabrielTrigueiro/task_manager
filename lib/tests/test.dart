import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/tests/MyWidget.dart';

main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    //crio o widget que quero testar aqui dentro e passo seus parametros utilizando pumpWidget()
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    //criando finders com o valor e tipo que esperamos
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');
  });
}
