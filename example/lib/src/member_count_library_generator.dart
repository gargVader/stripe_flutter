// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'dart:async' show Future;
import 'dart:convert';

class MemberCountLibraryGenerator extends Generator {
  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    final StringBuffer buffer = StringBuffer();

    // Generate code for the /charges endpoint
    Map chargesData = {
      "description":
          "Returns an object containing your available and pending balance, as well as the time at which it was computed.",
      "methods": [
        {"http_method": "GET", "endpoint": "/v1/balance", "parameters": []}
      ]
    };

    // Generate a class for the /charges endpoint
    buffer.writeln('import "utils.dart";');
    buffer.writeln('class ChargesApi {');

    // Generate methods for each HTTP method in the /charges endpoint
    for (final methodData in chargesData["methods"]) {
      print(methodData);
      final String httpMethod =
          (methodData['http_method'] as String).toLowerCase();
      print(httpMethod);
      final endpoint = methodData['endpoint'];
      final methodName = '${httpMethod}_$endpoint'.replaceAll('/', '_');
      print(methodName);
      var methodParameters = '';
      if ((methodData['parameters'] as List).isNotEmpty) {
        print('inside');
        methodParameters = _generateParameters(methodData['parameters']);
        print(methodParameters);
      }
      // Generate a method for the HTTP method
      buffer.writeln(
          '  void $methodName(${methodParameters}) async {');
      buffer.writeln('Utils.makeHTTPRequest("$endpoint", "${httpMethod.toUpperCase()}");    ');
      buffer.writeln('  }');
    }

    // Close the class
    buffer.writeln('}');

    return buffer.toString();
  }

  String _generateParameters(List<Map<String, dynamic>> parameters) {
    return parameters
        .map((param) => '${param['type']} ${param['name']}')
        .join(', ');
  }
}
