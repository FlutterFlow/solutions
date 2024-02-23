// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:html' as html;

Future<void> triggerFileDownloadFromAPIResponse(
    String rawBodyString, String mimeType, String fileName) async {
  try {
    final fileData = getBytesDataFromString(rawBodyString);
    final blob = createBlob(fileData, mimeType);
    downloadFileAs(fileName, blob);
  } catch (e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}

Uint8List getBytesDataFromString(String str) {
  return latin1.encode(str);
}

// Create a Blob from the response data
html.Blob createBlob(List<int> data, String contentType) {
  return html.Blob([data], contentType);
}

void downloadFileAs(String filename, html.Blob blob) {
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url);
  anchor.download = filename;
  anchor.click();

  // Release the object URL after a bit (works as cleanup)
  Future.delayed(const Duration(milliseconds: 100), () {
    html.Url.revokeObjectUrl(url);
  });
}
