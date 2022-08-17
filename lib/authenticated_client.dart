import 'package:http/http.dart' as http;

class AuthenticateClient extends http.BaseClient {
  final Map<String, String> headers;

  final http.Client client;

  AuthenticateClient(this.headers, this.client);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return client.send(request..headers.addAll(headers));
  }
}