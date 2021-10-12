import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:netflapp/core/failures/failure.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/domain/respository/tv_show_respository.dart';
import 'package:netflapp/presentation/screens/recents/bloc/recents_bloc.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  late MockTvShowRepository repository;
  late RecentsBloc bloc;

  List<TvShowModel> tRecent = [
    const TvShowModel(
        67419, '/zra8NrzxaEeunRWJmUm3HZOL4sd.jpg', 'Victoria', 1.39, 0, 0)
  ];

  setUp(() {
    repository = MockTvShowRepository();
    bloc = RecentsBloc(repository);
  });

  test('initial state should be AuthenticationInitial', () {
    // assert
    expect(bloc.state, RecentsInitial());
  });

  blocTest<RecentsBloc, RecentsState>(
    'emits [RecentsLoading, RecentsLoaded] when LoadRecent is added.',
    build: () {
      when(() => repository.getRecents())
          .thenAnswer((_) async => Right(tRecent));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadRecent()),
    expect: () => <RecentsState>[
      RecentsLoading(),
      RecentsLoaded(
        tRecent,
      )
    ],
  );

  blocTest<RecentsBloc, RecentsState>(
    'emits [RecentsLoading, RecentsLoadedFailed] when LoadRecent is added and an error ocurrs.',
    build: () {
      when(() => repository.getRecents())
          .thenAnswer((_) async => Left(Failure()));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadRecent()),
    expect: () => <RecentsState>[
      RecentsLoading(),
      RecentsLoadedFailed(),
    ],
  );
}
