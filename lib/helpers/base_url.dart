class BaseUrl {
  static String get baseUrl => 'pokeapi.co';

  static Uri apiUrlV2([
    String unencodedPath = '',
    Map<String, dynamic>? queryParameters,
  ]) =>
      Uri.https(baseUrl, '/api/v2/$unencodedPath');

  static Uri get generationUri => apiUrlV2('generation');
}
