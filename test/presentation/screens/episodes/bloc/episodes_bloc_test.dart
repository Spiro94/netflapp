import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:netflapp/core/failures/failure.dart';
import 'package:netflapp/data/models/tv_show_episode_model.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/domain/respository/tv_show_respository.dart';
import 'package:netflapp/presentation/screens/episodes/bloc/episodes_bloc.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  late MockTvShowRepository repository;
  late EpisodesBloc bloc;

  setUp(() {
    repository = MockTvShowRepository();
    bloc = EpisodesBloc(repository);
  });

  List<TvShowEpisodeModel> tEpisodes = [
    const TvShowEpisodeModel(
      3062390,
      'What If… T\'Challa Became a Star-Lord?',
      1,
      7.423,
      'The rough-and-tumble space pirates known as the Ravagers abduct T’Challa instead of Peter Quill.',
      '/urF7o2y7sG6GB53R0krSk9krw0E.jpg',
      1,
      '2021-08-11',
    )
  ];

  TvShowModel tShow = TvShowModel(
    91363,
    '/lztz5XBMG1x6Y5ubz7CxfPFsAcW.jpg',
    'What If...?',
    8.5,
    1,
    1,
    false,
    tEpisodes,
  );

  test('initial state should be HomeInitial', () {
    // assert
    expect(bloc.state, EpisodesInitial());
  });

  blocTest<EpisodesBloc, EpisodesState>(
    'emits [EpisodesLoaded] when LoadEpisodes is added.',
    build: () {
      when(() => repository.getSeasons(91363))
          .thenAnswer((_) async => Right(tShow));
      return bloc;
    },
    act: (bloc) => bloc.add(const LoadEpisodes(91363)),
    expect: () => <EpisodesState>[
      EpisodesLoading(),
      EpisodesLoaded(tShow),
    ],
  );

  blocTest<EpisodesBloc, EpisodesState>(
    'emits [EpisodesLoadedFailed] when LoadEpisodes is added and an error ocurrs.',
    build: () {
      when(() => repository.getSeasons(91363))
          .thenAnswer((_) async => Left(Failure()));
      return bloc;
    },
    act: (bloc) => bloc.add(const LoadEpisodes(91363)),
    expect: () => <EpisodesState>[
      EpisodesLoading(),
      EpisodesLoadedFailed(),
    ],
  );
}
