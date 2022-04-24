class CustomController<T> {
  CustomController({T? initialValue}) {
    if (initialValue != null) {
      value = initialValue;
    }
  }

  T? value;
}
