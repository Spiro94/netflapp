import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:netflapp/core/failures/failure.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/domain/respository/tv_show_respository.dart';
import 'package:netflapp/presentation/screens/home/bloc/home_bloc.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  late MockTvShowRepository repository;
  late HomeBloc bloc;

  setUp(() {
    repository = MockTvShowRepository();
    bloc = HomeBloc(repository);
  });

  List<TvShowModel> tPopulars = [
    const TvShowModel(31917, '/vC324sdfcS313vh9QXwijLIHPJp.jpg',
        'Pretty Little Liars', 5.04, 0, 0)
  ];

  List<TvShowModel> tRecommended = [
    const TvShowModel(64122, '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg',
        'The Shannara Chronicles', 5.5, 0, 0)
  ];

  TvShowModel tFavorite = const TvShowModel(64122,
      '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg', 'The Shannara Chronicles', 5.5, 0, 0);

  List<TvShowModel> tFavorites = const [
    TvShowModel(
      64122,
      '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg',
      'The Shannara Chronicles',
      5.5,
      0,
      0,
      true,
    ),
  ];

  List<TvShowModel> tRecommendedFav = const [
    TvShowModel(
      64122,
      '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg',
      'The Shannara Chronicles',
      5.5,
      0,
      0,
      true,
    ),
  ];

  test('initial state should be HomeInitial', () {
    // assert
    expect(bloc.state, HomeInitial());
  });

  blocTest<HomeBloc, HomeState>(
    'emits [TvShowsLoading, TvShowsLoaded] when LoadTvShows is added.',
    build: () {
      when(() => repository.getPopular())
          .thenAnswer((_) async => Right(tPopulars));
      when(() => repository.getRecommended())
          .thenAnswer((_) async => Right(tRecommended));
      when(() => repository.getFavorites())
          .thenAnswer((_) async => const Right([]));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTvShows()),
    expect: () => <HomeState>[
      TvShowsLoading(),
      TvShowsLoaded(tPopulars, tRecommended, const []),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [TvShowsLoading, TvShowsLoadFailed] when LoadTvShows is added and an error ocurrs within the repository.',
    build: () {
      when(() => repository.getPopular())
          .thenAnswer((_) async => Right(tPopulars));
      when(() => repository.getRecommended())
          .thenAnswer((_) async => Left(Failure()));
      when(() => repository.getFavorites())
          .thenAnswer((_) async => const Right([]));
      return bloc;
    },
    act: (bloc) => bloc.add(LoadTvShows()),
    expect: () => <HomeState>[
      TvShowsLoading(),
      TvShowsLoadFailed(),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [TvShowsLoading, TvShowsLoaded] when AddFavoriteFromHome is added and the serie is not a favorite.',
    build: () {
      when(() => repository.addFavorite(tFavorite))
          .thenAnswer((_) async => true);
      when(() => repository.getFavorites())
          .thenAnswer((_) async => Right([tFavorite]));

      return bloc;
    },
    act: (bloc) {
      bloc.emit(TvShowsLoaded(tPopulars, tRecommended, const []));
      bloc.add(AddFavoriteFromHome(tFavorite, false));
    },
    expect: () => <HomeState>[
      TvShowsLoaded(tPopulars, tRecommended, const []),
      TvShowsLoaded(tPopulars, tRecommendedFav, tFavorites),
    ],
  );

  blocTest<HomeBloc, HomeState>(
    'emits [TvShowsLoading, TvShowsLoadFailed] when AddFavoriteFromHome is added and an error ocurrs.',
    build: () {
      when(() => repository.addFavorite(tFavorite))
          .thenAnswer((_) async => true);
      when(() => repository.getFavorites())
          .thenAnswer((_) async => Left(Failure()));

      return bloc;
    },
    act: (bloc) {
      bloc.emit(TvShowsLoaded(tPopulars, tRecommended, const []));
      bloc.add(AddFavoriteFromHome(tFavorite, false));
    },
    expect: () => <HomeState>[
      TvShowsLoaded(tPopulars, tRecommended, const []),
      TvShowsLoadFailed(),
    ],
  );
}
