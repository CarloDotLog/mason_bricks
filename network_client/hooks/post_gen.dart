import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  await _createTest(context);
  await _installPackages(context);
}

Future<void> _installPackages(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter packages get` after generation.
  await Process.run('flutter', ['packages', 'add', 'http']);
  await Process.run('flutter', ['packages', 'get']);

  progress.complete();
}

Future<void> _createTest(HookContext context) async {
  final logger = context.logger;
  final directory = Directory.current.path;

  try {
    final testProgress = context.logger.progress('Generating test');


    List<String> folders;
    if (Platform.isWindows) {
      folders = directory.split(r'\').toList();
    } else {
      folders = directory.split('/').toList();
    }

    final libIndex = folders.indexWhere((folder) => folder == 'lib');
    var testDir = Directory(('${folders.sublist(0, libIndex).join('/')}/test'));

    // move test files under test/ folder
    await Process.run('mv', ['commons', testDir.path]);

    // complete
    testProgress.complete(green.wrap('Tests created!') as String);
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
