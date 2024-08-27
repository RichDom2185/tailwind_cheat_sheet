import 'package:flutter_test/flutter_test.dart';
import 'package:tailwind_cheat_sheet/main.dart';

void main() {
  testWidgets('App Renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('Tailwind Cheat Sheet'), findsOneWidget);
  });
}
