import 'package:isar/isar.dart';

// line is needed to generate the Isar collection
// then run: dart run build_runner build
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}