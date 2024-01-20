extension urlExtension on String {
  Map<String, String> get urlToMap {
   Map<String, String> response = {};
    this.substring(this.indexOf("?") + 1).split("&").forEach(
        (value) {
            response[value.split("=").first] = Uri.decodeComponent(value.split("=").last);
        });
    return response;
  }
}
