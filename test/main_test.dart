import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firstapp/gradient_container.dart'; // Replace with the correct path to the GradientContainer file

void main() {
  testWidgets('Test main screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
     const MaterialApp(
        home: GradientContainer(
          Colors.blue, // Replace with your desired colors
          Colors.green, // Replace with your desired colors
        ),
      ),
    );

   
    expect(find.byType(Image), findsOneWidget);

    // Verify that the ButtonWidget widgets are present
    expect(find.text('scorers'), findsOneWidget);
    expect(find.text('Passeurs'), findsOneWidget);
    expect(find.text('rebonds'), findsOneWidget);
  });
}
