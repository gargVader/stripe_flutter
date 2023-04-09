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
    "methods": [
      {
        "http_method": "GET",
        "endpoint": "/v1/balance",
        "description": "Returns an object containing your available and pending balance, as well as the time at which it was computed.",
        "parameters": [],
        "endpoint_parameters": []
      }
    ]
  },
  {
    "name": "BalanceTransactions",
    "methods": [
      {
        "http_method": "GET",
        "endpoint": "/v1/balance_transactions",
        "description": "A dictionary with a data property that contains an array of up to limit transactions, starting after transaction starting_after. Each entry in the array is a separate transaction history object. If no more transactions are available, the resulting array will be empty.",
        "parameters": [],
        "endpoint_parameters": []
      },
      {
        "http_method": "GET",
        "endpoint": "/v1/balance_transactions/id",
        "description": "Returns a balance transaction if a valid balance transaction ID was provided. Returns an error otherwise.",
        "parameters": [],
        "endpoint_parameters": [
          {
            "name": "id",
            "type": "String"
          }
        ]
      }
    ]
  }
]''';

    final apis = jsonDecode(dataString);
    buffer.writeln('import "utils.dart";');

    for (final api in apis) {
      String generatedClass = _generateClass(api);
      buffer.writeln(generatedClass);
    }

    return buffer.toString();
  }

  String _generateClass(final api) {
    StringBuffer buffer = new StringBuffer();
    String name = api["name"];

    // Create class for api
    String className = '${name}Api';
    buffer.writeln('class $className {');

    // Generate methods for each HTTP method in the /charges endpoint
    for (Map<String, dynamic> method in api["methods"]) {
      String generatedMethod = _generateMethod(method);
      buffer.writeln(generatedMethod);
    }

    // Close the class
    buffer.writeln('}\n\n');
    return buffer.toString();
  }

  String _generateMethod(Map<String, dynamic> method) {
    StringBuffer buffer = new StringBuffer();

    final String httpMethod = (method['http_method'] as String);
    final String description = method['description'];
    final endpoint = method['endpoint'];
    List endpoint_parameters = method['endpoint_parameters'];
    List parameters = method['parameters'];

    final methodName =
        '${httpMethod.toLowerCase()}_$endpoint'.replaceAll('/', '_');
    final generatedParameters =
        _generateMethodParameters(endpoint_parameters, parameters);
    final generatedEndpoint = _generateEndpoint(endpoint, endpoint_parameters);
    print('generatedEndpoint = $generatedEndpoint');

    // Generate a method for the HTTP method
    buffer.writeln('  // $description');
    buffer.writeln('  void $methodName(${generatedParameters}) async {');
    buffer.writeln(
        'Utils.makeHTTPRequest("$generatedEndpoint", "${httpMethod.toUpperCase()}");    ');
    buffer.writeln('  }\n\n');

    return buffer.toString();
  }

  String _generateEndpoint(String endpoint, List? endpoint_parameters) {
    if (endpoint_parameters == null) return endpoint;
    for (Map<String, dynamic> param in endpoint_parameters) {
      String name = param['name'];
      String type = param['type'];
      endpoint = endpoint.replaceAll(name, "\$$name");
    }
    return endpoint;
  }

  String _generateMethodParameters(List endpoint_parameters, List parameters) {
    String list1 = endpoint_parameters
        .map((param) => '${param['type']} ${param['name']}')
        .join(', ');
    String list2 = parameters
        .map((param) => '${param['type']} ${param['name']}')
        .join(', ');
    String final_list = '';
    if (endpoint_parameters.isNotEmpty) final_list += list1;
    if (parameters.isNotEmpty) {
      if(endpoint_parameters.isNotEmpty) final_list += ', ';
      final_list += list2;
    }
    return final_list;
  }
}
