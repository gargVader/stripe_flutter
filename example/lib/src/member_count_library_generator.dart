// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MemberCountLibraryGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final StringBuffer buffer = StringBuffer();

    // Generate code for the /charges endpoint
    String dataString = '''[
  {
    "name": "Balance",
    "description": "Returns an object containing your available and pending balance, as well as the time at which it was computed.",
    "methods": [
      {
        "http_method": "GET",
        "endpoint": "/v1/balance",
        "parameters": []
      }
    ]
  }
]''';

    final apis = jsonDecode(dataString);
    buffer.writeln('import "utils.dart";');

    for (final api in apis) {
      String name = api["name"];

      // Create class for api
      String className = '${name}Api';
      buffer.writeln('class $className {');

      // Generate methods for each HTTP method in the /charges endpoint
      // for (Map<String, dynamic> method in api["methods"]) {
      //   final String httpMethod =
      //       (method['http_method'] as String).toLowerCase();
      //   final endpoint = method['endpoint'];
      //   final parameters = method['parameters'];
      //   final methodName = '${httpMethod}_$endpoint'.replaceAll('/', '_');
      //   var methodParameters = _generateParameters(parameters);
      //   // Generate a method for the HTTP method
      //   buffer.writeln('  void $methodName(${methodParameters}) async {');
      //   buffer.writeln(
      //       'Utils.makeHTTPRequest("$endpoint", "${httpMethod.toUpperCase()}");    ');
      //   buffer.writeln('  }\n\n');
      // }

      // Close the class
      buffer.writeln('}\n\n');
    }

    return buffer.toString();
  }

  String _generateParameters(List<Map<String, dynamic>> parameters) {
    if (parameters.isEmpty) return '';
    return parameters
        .map((param) => '${param['type']} ${param['name']}')
        .join(', ');
  }
}
