import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) async {
  await _createTest(context);
}

Future<void> _createTest(HookContext context) async {
  final logger = context.logger;
  final directory = Directory.current.path;

  try {
    List<String> folders;
    if (Platform.isWindows) {
      folders = directory.split(r'\').toList();
    } else {
      folders = directory.split('/').toList();
    }

    final libIndex = folders.indexWhere((folder) => folder == 'lib');

    final pubSpecFile =
        File('${folders.sublist(0, libIndex).join('/')}/pubspec.yaml');
    final networkFolderDir =
        folders.sublist(libIndex + 1, folders.length).join('/');

    final content = await pubSpecFile.readAsString();
    final yamlMap = loadYaml(content);
    final packageName = yamlMap['name'];

    // Update vars.
    context.vars["full_path"] =
        ('$packageName/$networkFolderDir/').replaceAll('//', '/');
  } on RangeError catch (_) {
    logger.alert(
      red.wrap(
        'Could not find lib folder in $directory',
      ),
    );
    logger.alert(
      red.wrap(
        'Re-run this brick inside your lib folder',
      ),
    );
    throw Exception();
  } on FileSystemException catch (_) {
    logger.alert(
      red.wrap(
        'Could not find pubspec.yaml folder in ${directory.replaceAll('\\lib', '')}',
      ),
    );

    throw Exception();
  } on Exception catch (e) {
    throw e;
  }
}
