import 'dart:io';

void main () async {
  var notesFile = File('notes.txt');
  var lines = await notesFile.readAsLines();
  var i = 1;
  if (lines.length == 0) {
    print("There are no notes");
  }
  lines.forEach((line) {
    print(i.toString() + ". " + line);
    i += 1;
  });

  stdout.write('Type a new note: ');
  var newNote = stdin.readLineSync();

  await notesFile.writeAsString('$newNote\n', mode: FileMode.append);
  var updatedLines = await notesFile.readAsLines();
  print("There are now " + updatedLines.length.toString() + " notes");
  var j = 1;
  updatedLines.forEach((line) {
    print(j.toString() + ". " + line);
    j += 1;
  });
}