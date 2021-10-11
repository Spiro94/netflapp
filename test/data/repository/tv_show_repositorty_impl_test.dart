import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:netflapp/core/failures/failure.dart';
import 'package:netflapp/core/utils/constants.dart';
import 'package:netflapp/data/models/tv_show_model.dart';
import 'package:netflapp/data/repository/tv_show_repositorty_impl.dart';

import '../../json/json_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late TvShowRepositoryImpl tvShowRepositoryImpl;

  setUpAll(() {
    registerFallbackValue(Uri());
    mockHttpClient = MockHttpClient();
    tvShowRepositoryImpl = TvShowRepositoryImpl(mockHttpClient);
  });

  group('GetPopular', () {
    List<TvShowModel> tPopulars = [
      const TvShowModel(31917, '/vC324sdfcS313vh9QXwijLIHPJp.jpg',
          'Pretty Little Liars', 5.04, null, null)
    ];
    test('should perform a GET request on the endpoint URL', () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response(jsonReader('popular.json'), 200, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      //act
      await tvShowRepositoryImpl.getPopular();
      //assert

      verify(() => mockHttpClient.get(Uri.parse(
          url + '/tv/popular?api_key=$movieApiKey&language=en-US&page=1')));
    });

    test(
        'should return a list of popular TvShowModel when the response code is 200 (success)',
        () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response(jsonReader('popular.json'), 200, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      //act
      final result = await tvShowRepositoryImpl.getPopular();
      var list = [];
      if (result.isRight()) {
        result.fold((l) => null, (r) => list = r);
        //assert
        expect(list, tPopulars);
      }
    });

    test('should return a failure when the response code is 404 or other',
        () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response('Error ocurred', 404, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      //act
      final result = await tvShowRepositoryImpl.getPopular();
      Failure? failure;
      if (result.isLeft()) {
        result.fold((l) => failure = l, (r) => null);
        //assert
        expect(failure, Failure());
      }
    });
  });

  group('GetRecommended', () {
    List<TvShowModel> tRecommended = [
      const TvShowModel(64122, '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg',
          'The Shannara Chronicles', 5.5, null, null)
    ];
    test('should perform a GET request on the endpoint URL', () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer((_) async =>
          http.Response(jsonReader('recommended.json'), 200, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }));

      //act
      await tvShowRepositoryImpl.getRecommended();
      //assert

      verify(() => mockHttpClient.get(Uri.parse(
          url + '/tv/top_rated?api_key=$movieApiKey&language=en-US&page=1')));
    });

    test(
        'should return a list of recommended TvShowModel when the response code is 200 (success)',
        () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer((_) async =>
          http.Response(jsonReader('recommended.json'), 200, headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          }));

      //act
      final result = await tvShowRepositoryImpl.getRecommended();
      var list = [];
      if (result.isRight()) {
        result.fold((l) => null, (r) => list = r);
        //assert
        expect(list, tRecommended);
      }
    });

    test('should return a failure when the response code is 404 or other',
        () async {
      //arrange
      when(() => mockHttpClient.get(any())).thenAnswer(
          (_) async => http.Response('Error ocurred', 404, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      //act
      final result = await tvShowRepositoryImpl.getRecommended();
      Failure? failure;
      if (result.isLeft()) {
        result.fold((l) => failure = l, (r) => null);
        //assert
        expect(failure, Failure());
      }
    });
  });

  group('Favorites', () {
    TvShowModel tFavorite = const TvShowModel(
      64122,
      '/aurZJ8UsXqhGwwBnNuZsPNepY8y.jpg',
      'The Shannara Chronicles',
      5.5,
      0,
      0,
      true,
    );
    List<TvShowModel> tFavorites = [tFavorite];
    test('should add a Favorite successfuly', () async {
      //arrange

      //act
      var result = await tvShowRepositoryImpl.addFavorite(tFavorite);

      //assert
      expect(result, true);
    });
    test('should get the list of favorites successfuly', () async {
      //arrange
      await tvShowRepositoryImpl.addFavorite(tFavorite);

      //act
      var call = await tvShowRepositoryImpl.getFavorites();

      //assert
      List<TvShowModel> favorites = [];
      call.fold((l) => null, (r) => favorites = r);

      expect(favorites, tFavorites);
    });
  });
}
