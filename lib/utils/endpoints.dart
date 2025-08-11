  final String baseurl=" https://fakestoreapi.com";


Uri buildBaseUrl(String endPoint) {
  Uri url = Uri.parse(endPoint);
  if (!endPoint.startsWith('http')) url = Uri.parse('$baseurl$endPoint');


  return url;
}