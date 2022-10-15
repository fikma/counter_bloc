import 'package:bloc_test/bloc_test.dart';
import 'package:fatree/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

const _increaseBtnKey = Key('counterView_increase_floatingActionButton');
const _decreaseBtnKey = Key('counterView_decrease_floatingActionButton');

void main() {
  late CounterCubit counterCubit;

  setUp(() {
    counterCubit = MockCounterCubit();
  });

  group('CounterView', () {
    testWidgets(
      'render CounterCubit state yang aktif sekarang',
      (tester) async {
        // set counter state ke 42
        when(() => counterCubit.state).thenReturn(42);
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          ),
        );

        expect(find.text('42'), findsOneWidget);
      },
    );

    testWidgets(
      'Tap tombol tambah memanggil increase',
      (tester) async {
        when(() => counterCubit.state).thenReturn(0);
        when(() => counterCubit.increase()).thenReturn(null);

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          ),
        );

        await tester.tap(find.byKey(_increaseBtnKey));
        verify(() => counterCubit.increase()).called(1);
      },
    );

    testWidgets(
      'Tap tombol minus memanggil decrease',
      (tester) async {
        when(() => counterCubit.state).thenReturn(0);
        when(() => counterCubit.decrease()).thenReturn(null);

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: const CounterView(),
            ),
          ),
        );
        final decrementFinder = find.byKey(_decreaseBtnKey);
        await tester.ensureVisible(decrementFinder);
        await tester.tap(decrementFinder);
        verify(() => counterCubit.decrease()).called(1);
      },
    );
  });
}
