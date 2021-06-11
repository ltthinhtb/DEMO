import 'dart:io';

class Media {
  File file;
  MediaFile type;

  Media(this.file, this.type);
}

enum MediaFile { video, image }
