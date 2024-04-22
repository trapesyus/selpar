class CariListesiServiceModel {
  bool? result;
  String? message;
  String? kayitSayisi;
  List<CariData>? data;

  CariListesiServiceModel(
      {this.result, this.message, this.kayitSayisi, this.data});

  CariListesiServiceModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    kayitSayisi = json['KayitSayisi'];
    if (json['data'] != null) {
      data = <CariData>[];
      json['data'].forEach((v) {
        data!.add(CariData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['KayitSayisi'] = kayitSayisi;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CariData {
  String? musteriID;
  String? firmaKodu;
  String? firmaAdi;
  String? kullanici;
  String? cariunvan;
  String? vnumarasi;
  String? vdairesi;
  String? telefon;
  String? gSM;
  String? adresi;
  Null? sMSonay;
  String? aracPlaka;
  String? aracMarka;
  String? aracModel;
  String? aracSaseno;
  String? ruhsatSeriNo;
  String? trafikPolice;
  String? il;
  String? ilce;
  String? email;
  String? musteriTipi;
  String? bakiye;
  String? vadesi;
  String? borc;
  String? alacak;

  CariData(
      {this.musteriID,
      this.firmaKodu,
      this.firmaAdi,
      this.kullanici,
      this.cariunvan,
      this.vnumarasi,
      this.vdairesi,
      this.telefon,
      this.gSM,
      this.adresi,
      this.sMSonay,
      this.aracPlaka,
      this.aracMarka,
      this.aracModel,
      this.aracSaseno,
      this.ruhsatSeriNo,
      this.trafikPolice,
      this.il,
      this.ilce,
      this.email,
      this.musteriTipi,
      this.bakiye,
      this.vadesi,
      this.borc,
      this.alacak});

  CariData.fromJson(Map<String, dynamic> json) {
    musteriID = json['MusteriID'];
    firmaKodu = json['FirmaKodu'];
    firmaAdi = json['FirmaAdi'];
    kullanici = json['Kullanici'];
    cariunvan = json['Cariunvan'];
    vnumarasi = json['Vnumarasi'];
    vdairesi = json['Vdairesi'];
    telefon = json['Telefon'];
    gSM = json['GSM'];
    adresi = json['Adresi'];
    sMSonay = json['SMSonay'];
    aracPlaka = json['AracPlaka'];
    aracMarka = json['AracMarka'];
    aracModel = json['AracModel'];
    aracSaseno = json['AracSaseno'];
    ruhsatSeriNo = json['RuhsatSeriNo'];
    trafikPolice = json['TrafikPolice'];
    il = json['Il'];
    ilce = json['Ilce'];
    email = json['Email'];
    musteriTipi = json['MusteriTipi'];
    bakiye = json['Bakiye'];
    vadesi = json['Vadesi'];
    borc = json['Borc'];
    alacak = json['Alacak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MusteriID'] = musteriID;
    data['FirmaKodu'] = firmaKodu;
    data['FirmaAdi'] = firmaAdi;
    data['Kullanici'] = kullanici;
    data['Cariunvan'] = cariunvan;
    data['Vnumarasi'] = vnumarasi;
    data['Vdairesi'] = vdairesi;
    data['Telefon'] = telefon;
    data['GSM'] = gSM;
    data['Adresi'] = adresi;
    data['SMSonay'] = sMSonay;
    data['AracPlaka'] = aracPlaka;
    data['AracMarka'] = aracMarka;
    data['AracModel'] = aracModel;
    data['AracSaseno'] = aracSaseno;
    data['RuhsatSeriNo'] = ruhsatSeriNo;
    data['TrafikPolice'] = trafikPolice;
    data['Il'] = il;
    data['Ilce'] = ilce;
    data['Email'] = email;
    data['MusteriTipi'] = musteriTipi;
    data['Bakiye'] = bakiye;
    data['Vadesi'] = vadesi;
    data['Borc'] = borc;
    data['Alacak'] = alacak;
    return data;
  }
}
