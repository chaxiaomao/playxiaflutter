abstract class HttpClient {
  Future get(String path, dynamic data);
  Future post(String path, dynamic data);
}