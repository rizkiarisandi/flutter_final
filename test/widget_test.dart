import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_final/main.dart';
import 'package:flutter_final/screens/onboarding_screen.dart';

void main() {
  testWidgets('OnboardingScreen has two onboarding pages with correct text', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MyApp());

    // Verifikasi apakah terdapat widget OnboardingScreen
    expect(find.byType(OnboardingScreen), findsOneWidget);

    // Verifikasi halaman pertama dari onboarding
    expect(find.text('Donor Darah'), findsOneWidget);
    expect(find.text('Ayoo Donor Sekarang Juga!'), findsOneWidget);
    expect(find.text('Lanjut'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);

    // Pindah ke halaman kedua dengan menekan tombol 'Lanjut'
    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle();

    // Verifikasi halaman kedua dari onboarding
    expect(find.text('Layanan Lengkap'), findsOneWidget);
    expect(find.text('Jaga kesehatan mentalmu dengan berbagai fitur yang tersedia'), findsOneWidget);

    // Pastikan halaman pertama tidak lagi muncul
    expect(find.text('Donor Darah'), findsNothing);
  });

  testWidgets('Skip button jumps to the last onboarding page', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MyApp());

    // Tekan tombol 'Skip'
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Verifikasi apakah sudah di halaman terakhir
    expect(find.text('Layanan Lengkap'), findsOneWidget);
    expect(find.text('Jaga kesehatan mentalmu dengan berbagai fitur yang tersedia'), findsOneWidget);

    // Pastikan halaman pertama tidak lagi muncul
    expect(find.text('Donor Darah'), findsNothing);
  });

  testWidgets('Swipe gesture moves to the next page', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(MyApp());

    // Geser ke kiri untuk pindah ke halaman berikutnya
    await tester.drag(find.byType(PageView), const Offset(-400.0, 0.0));
    await tester.pumpAndSettle();

    // Verifikasi bahwa halaman kedua muncul
    expect(find.text('Layanan Lengkap'), findsOneWidget);
    expect(find.text('Jaga kesehatan mentalmu dengan berbagai fitur yang tersedia'), findsOneWidget);

    // Pastikan halaman pertama tidak lagi muncul
    expect(find.text('Donor Darah'), findsNothing);
  });
}
