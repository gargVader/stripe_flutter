import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../annotations.dart';

class ChargesGenerator extends GeneratorForAnnotation<Charges> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    return '// charges';
  }

 String _generateParameters(List<Map<String, dynamic>> parameters) {
    return parameters
        .map((param) => '${param['type']} ${param['name']}')
        .join(', ');
  }
}
