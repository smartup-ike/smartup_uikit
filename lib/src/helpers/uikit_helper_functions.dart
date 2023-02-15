T define<T>(T? passedData, T themeData) {
  T temp;
  if (passedData != null) {
    temp = passedData;
  } else {
    temp = themeData;
  }
  return temp;
}
