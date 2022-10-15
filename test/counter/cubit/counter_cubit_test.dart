import 'package:bloc_test/bloc_test.dart';
import 'package:fatree/counter/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('Inisial state harus 0', () {
      expect(CounterCubit().state, 0);
    });

    group('increase', () {
      blocTest<CounterCubit, int>(
        'Emits [1] ketika state 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.increase(),
        expect: () => const <int>[1],
      );

      blocTest<CounterCubit, int>(
        'Emits [1, 2] ketika state 0 dan dipanggil 2 kali',
        build: CounterCubit.new,
        act: (cubit) {
          cubit
            ..increase()
            ..increase();
        },
        expect: () => const <int>[1, 2],
      );

      blocTest<CounterCubit, int>(
        'Emits [38] ketika isi state 37',
        build: CounterCubit.new,
        seed: () => 37,
        act: (cubit) => cubit.increase(),
        expect: () => const <int>[38],
      );
    });

    group('decrease', () {
      blocTest<CounterCubit, int>(
        'Emits [-1] ketika state 0',
        build: CounterCubit.new,
        act: (cubit) => cubit.decrease(),
        expect: () => const <int>[-1],
      );

      blocTest<CounterCubit, int>(
        'Emits [-1, -2] ketika state 0 dan dipanggil 2 kali',
        build: CounterCubit.new,
        act: (cubit) {
          cubit
            ..decrease()
            ..decrease();
        },
        expect: () => const <int>[-1, -2],
      );

      blocTest<CounterCubit, int>(
        'Emits [21] ketika isi state 22',
        build: CounterCubit.new,
        seed: () => 22,
        act: (cubit) => cubit.decrease(),
        expect: () => const <int>[21],
      );
    });
  });
}
