class QuranModel {
  int? number;
  String? name;
  String? nameLat;
  int? countAyah;
  String? createLocation;
  String? author;
  String? description;
  String? audio;

  QuranModel(
      {this.number,
        this.name,
        this.nameLat,
        this.countAyah,
        this.createLocation,
        this.author,
        this.description,
        this.audio});

  QuranModel.fromJson(Map<String, dynamic> json) {
    number = json['nomor'];
    name = json['nama'];
    nameLat = json['nama_latin'];
    countAyah = json['jumlah_ayat'];
    createLocation = json['tempat_turun'];
    author = json['arti'];
    description = json['deskripsi'];
    audio = json['audio'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['nomor'] = number;
    data['nama'] = name;
    data['nama_latin'] = nameLat;
    data['jumlah_ayat'] = countAyah;
    data['tempat_turun'] = createLocation;
    data['arti'] = author;
    data['deskripsi'] = description;
    data['audio'] = audio;
    return data;
  }
}


const List<String> suraName = [
  'Al-Fatihah','Al-Baqarah',"Ali 'Imran",'An-Nisa',"Al-Ma'idah","Al-'Anam","Al-'Araf",'Al-Anfal','At-Tawbah','Yunus',
  'Hud','Yusuf',"Ar-Ra'd",'Ibrahim','Al-Hijr','An-Nahl','Al-Isra','Al-Kahf','Maryam','Taha',
  'Al-Anbya','Al-Hajj',"Al-Mu'minun",'An-Nur','Al-Furqan',"Ash-Shu'ara","An-Naml","Al-Qasas","Al-'Ankubat","Ar-Rum",
  "Luqman","As-Sajdah","Al-Ahzab","Saba","Fatir","Ya-sin","As-Saffat","Sad","Az-Zumar","Ghafir",
  "Fussilat","Ash-Ashuraa","Az-Zukhruf","Ad-Dukhan","Al-Jatniyah","Al-Ahqaf","Muhammad","Al-Fath","Al-Hujurat","Qaf",
  "Adh-Dhariyat","At-Tur","An-Najm","Al-Qamar","Ar-Rahman","Al-Waqi'ah","Al-Hadid","Al-Mujadila","Al-Hashr","Al-Mumtahanah",
  "As-Saf","Al-Jumu'ah","Al-Munafiqun","At-Taghabun","At-Talaq","At-Tahrim","Al-Mulk","Al-Qalam","Al-Haqqah","Al-Ma'arjj",
  "Nuh","Al-Jinn","Al-Muzzammil","Al-Muddathtir","Al-Qiyamah","Al-Insan","Al-Mursalat","An-Naba","An-Na'ziat","'Abasa",
  "At-Takwir","Al-Infitar","Al-Mutaffifin","Al-Inshiqaq","Al-Buruj","At-Tariq","Al-A'la","Al-Ghashiyah","Al-Fajr","Al-Balad",
  "Ash-Shams","Al-Layl","Ad-Duhaa","Ash-Sharh","At-Tin","Al-'Alaq","Al-Qadr","Al-Bayyinah","Az-Zaizalh","Al-'Adiyat",
  "Al-Qari'ah","At-Takathur","Al-'Asr","Al-Humazah","Al-Fil","Quraysh","Al-Ma'un","Al-Kawthar","Al-Kafirun","An-Nasr",
  "Al-Masad","Al-Iklhas","Al-Falaq","An-Nas"
  ];