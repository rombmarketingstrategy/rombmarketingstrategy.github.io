import 'dart:typed_data';

Uint8List listToUInt8List(List<dynamic> dynamicList) {
  final List<int> intList = dynamicList.cast<int>().toList(); //This is the magical line.
  final Uint8List data = Uint8List.fromList(intList);
  return data;
}
