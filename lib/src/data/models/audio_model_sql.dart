class AudioModelSqlFields {
  static String id = '_id';
  static String number = '_number';
  static String name = '_name';
  static String nameLat = '_nameLat';
  static String countAyah = '_countAyah';
  static String createLocation = '_createLocation';
  static String author = '_author';
  static String description = '_description';
  static String audio = '_audio';

  static String tableName = 'Quran';
}

class QuranModelSql {
  final int number;
  final String nameLat;
  final int countAyah;
  final String createLocation;
  final String description;
  final String audio;
  final String name;
  final String author;
  int? id;

  QuranModelSql(
      {required this.name,
      required this.author,
      required this.number,
      required this.nameLat,
      required this.description,
      required this.audio,
      required this.countAyah,
      required this.createLocation,
      this.id});

  factory QuranModelSql.fromJson(Map<String, dynamic> json) => QuranModelSql(
      name: json[AudioModelSqlFields.name],
      author: json[AudioModelSqlFields.author],
      id: json[AudioModelSqlFields.id],
      audio: json[AudioModelSqlFields.audio],
      number: json[AudioModelSqlFields.number],
      nameLat: json[AudioModelSqlFields.nameLat],
      description: json[AudioModelSqlFields.description],
      countAyah: json[AudioModelSqlFields.countAyah],
      createLocation: json[AudioModelSqlFields.createLocation]);

  QuranModelSql copyWith({
    String? name,
    String? author,
    String? audio,
    int? number,
    int? countAyah,
    String? nameLat,
    String? description,
    String? createLocation,
    int? id,
  }) =>
      QuranModelSql(
          name: name ?? this.name,
          author: author ?? this.author,
          audio: audio ?? this.audio,
          id: id ?? this.id,
          number: number ?? this.number,
          nameLat: nameLat ?? this.nameLat,
          description: description ?? this.description,
          countAyah: countAyah ?? this.countAyah,
          createLocation: createLocation ?? this.createLocation);

  Map<String, dynamic> toJson() => {
        AudioModelSqlFields.name: name,
        AudioModelSqlFields.audio: audio,
        AudioModelSqlFields.author: author,
        AudioModelSqlFields.id: id,
        AudioModelSqlFields.createLocation : createLocation,
        AudioModelSqlFields.nameLat : nameLat,
        AudioModelSqlFields.countAyah : countAyah,
        AudioModelSqlFields.description : description,
        AudioModelSqlFields.number : number,
      };
}
