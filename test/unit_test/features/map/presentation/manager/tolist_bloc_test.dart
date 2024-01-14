import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_ws/features/map/presentation/manager/locations_bloc.dart';

import '../../domain/use_cases/get_locations_usecase_test.mocks.dart';

main() {
  group('Location Bloc', () {
    late LocationsBloc locationsBloc;
    late MockGetLocationsUseCase getLocationsUseCase;

    setUpAll(() {
      EquatableConfig.stringify = true;
      getLocationsUseCase = MockGetLocationsUseCase();
      locationsBloc = LocationsBloc(getLocationsUseCase);
    });

    LocationsBloc buildBloc() {
      return LocationsBloc(getLocationsUseCase);
    }

    test('Initial state of LocationsBloc is Location Initial', () {
      expect(locationsBloc.state, const LocationsInitial());
    });

    blocTest<LocationsBloc, LocationsState>(
      'emits  when nothing is done',
      build: () => locationsBloc,
      expect: () => [],
    );

    blocTest<LocationsBloc, LocationsState>(
        'The LocationBloc should emit a LocationsLoading()',
        build: buildBloc,
        act: (bloc) => bloc.add(const LocationSocketLoading()),
        expect: () =>
            [const LocationsLoading(), const LocationsError("errorMessage")]);

    tearDown(() {
      locationsBloc.close();
    });
  });
}
