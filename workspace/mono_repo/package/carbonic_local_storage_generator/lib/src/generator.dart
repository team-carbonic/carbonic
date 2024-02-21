import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:carbonic_local_storage_annotation/carbonic_local_storage_annotation.dart';
import 'package:source_gen/source_gen.dart';

class LocalStorageGenerator
    extends GeneratorForAnnotation<CarbonicLocalStorageCategory> {
  const LocalStorageGenerator();

  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element.kind != ElementKind.ENUM) {
      throw InvalidGenerationSourceError(
        'The @storages() annotation can only be used on enums.',
        element: element,
      );
    }

    final implementation =
        _LocalStorageGeneratorImplementation(element as EnumElement);
    return implementation.generate();
  }
}

class _LocalStorageGeneratorImplementation {
  final EnumElement element;
  final _generatedCode = StringBuffer();

  _LocalStorageGeneratorImplementation(this.element)
      : assert(element.kind == ElementKind.ENUM);

  String generate() {
    _generateExtensionHeader();
    _generateStorageGetter();
    _generateStorageKeyGetter();
    _generateExtensionBottom();
    return _generatedCode.toString();
  }

  void _generateExtensionHeader() => _generatedCode.writeln(
        'extension ${element.name}GeneratedExtension on ${element.name} {',
      );

  void _generateStorageGetter() => _generatedCode.writeln(
        'GetStorage get storage => GetStorage(storageKey);',
      );

  void _generateStorageKeyGetter() => _generatedCode
    ..writeln(r"String get storageKey => name.replaceAllMapped(")
    ..writeln(r"RegExp('[A-Z]'),")
    ..writeln(r"(match) => '_${match.group(0)!.toLowerCase()}',")
    ..writeln(r");");

  void _generateExtensionBottom() => _generatedCode.writeln('}');
}
