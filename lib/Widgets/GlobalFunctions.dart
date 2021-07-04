String toCamelCase(String value) {
  return value;
}

String concatenateLargeNumber(int value) {
  String _shortenedValue;

  if (value.toString().length > 3) {
    _shortenedValue =
        value.toString().substring(0, value.toString().length - 3);

    return _shortenedValue + "k";
  } else {
    return value.toString();
  }
}
