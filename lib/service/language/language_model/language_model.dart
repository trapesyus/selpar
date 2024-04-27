class LanguageModel {
  Tr? tr;
  Tr? en;
  Tr? de;
  Tr? ru;
  Tr? flemish;

  LanguageModel({this.tr, this.en, this.de, this.ru, this.flemish});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    tr = json['tr'] != null ? Tr.fromJson(json['tr']) : null;
    en = json['en'] != null ? Tr.fromJson(json['en']) : null;
    de = json['de'] != null ? Tr.fromJson(json['de']) : null;
    ru = json['ru'] != null ? Tr.fromJson(json['ru']) : null;
    flemish = json['flemish'] != null ? Tr.fromJson(json['flemish']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tr != null) {
      data['tr'] = tr!.toJson();
    }
    if (en != null) {
      data['en'] = en!.toJson();
    }
    if (de != null) {
      data['de'] = de!.toJson();
    }
    if (ru != null) {
      data['ru'] = ru!.toJson();
    }
    if (flemish != null) {
      data['flemish'] = flemish!.toJson();
    }
    return data;
  }
}

class Tr {
  String? girisYap;
  String? kaydol;
  String? slogan;
  String? mail;
  String? sifre;
  String? anyAccount;
  String? firmaAdi;
  String? yetkiliAdSoyad;
  String? adres;
  String? telefon;
  String? basliklardaAra;
  String? hesapOzeti;
  String? bakiye;
  String? hizliIslemMenusu;
  String? tahsilatEkle;
  String? odemeEkle;
  String? cekSenet;
  String? satisGiris;
  String? gunuGelen;
  String? gunuGecen;
  String? teklif;
  String? stok;
  String? stokIhtiyac;
  String? siparis;
  String? cariListesi;
  String? cariListesiniGormekIcinTiklayin;
  String? adet;
  String? kapaliOnarimlar;
  String? tahsilatiYapilmayanOnarimlar;
  String? oncekiOnarimlar;
  String? silinenKabulListesi;
  String? tahsilatListesi;
  String? bugunYapilacakTahsilatlar;
  String? odemeListesi;
  String? bugunYapilacakOdemeler;
  String? butunAlacaklarOdemeler;
  String? stokListesi;
  String? orjinalStokListesi;
  String? satisIslemi;
  String? alisIslemi;
  String? satisEvrakListesi;
  String? alisEvrakListesi;
  String? gelenFatura;
  String? gidenFatura;
  String? gidenEIrsaliye;
  String? alinanSiparisGirisi;
  String? alinanSiparisListesi;
  String? verilenSiparisGirisi;
  String? verilenSiparisListesi;
  String? servisIslemleri;
  String? finansIslemleri;
  String? stokIslemleri;
  String? alimSatimIslemleri;
  String? eIslemler;
  String? siparisIslemleri;
  String? plakaCariVsArama;
  String? baslangic;
  String? bitis;
  String? goster;
  String? ekstra;
  String? detay;
  String? alacakVerecek;
  String? makbuzNo;
  String? cariAdi;
  String? tarihSec;
  String? tutar;
  String? aciklama;
  String? ara;
  String? stokNoyaGoreAra;
  String? stokAdinaGoreAra;
  String? fiyati;
  String? rafYeri;
  String? faturaTipi;
  String? kdvTipi;
  String? vergiNo;
  String? vergiDairesi;
  String? gsm;
  String? stokNumarasi;
  String? stokAdi;
  String? miktar;
  String? fiyat;
  String? ist;
  String? kdv;
  String? toplam;
  String? kaydet;
  String? ekle;
  String? tarih;
  String? verilenCek;
  String? verilenSenet;
  String? alinanCek;
  String? alinanSenet;
  String? verilenCekSenet;
  String? alinanCekSenet;
  String? alinanVerilenCekSenet;
  String? stokNoGirin;
  String? urunAdiGirin;
  String? ihtiyacAdedi;
  String? mevcut;
  String? stokIhtiyacRaporu;
  String? alinanVerilenSiparis;
  String? hesap;
  String? ayarlar;
  String? dilSeciniz;
  String? turkce;
  String? ingilizce;
  String? almanca;
  String? rusca;
  String? flemenkce;
  String? dilSecimiBasariylaGerceklestirildi;
  String? cikisYap;
  String? cariyeGoreAramaYapin;
  String? bugunAcilanKabulKartlari;
  String? acikKartlar;
  String? bugunKapatilanKartlar;
  String? hesabinYokMu;
  String? aramayanlisyazdNZ;
  String? ekstre;
  String? alacak;
  String? borc;
  String? guncelBakiyesi;
  String? cariEkstre;
  String? cariDetay;
  String? adresBilgisiBulunamadi;
  String? telefonBilgisiBulunamadi;
  String? vergiBilgisiBulunamadi;
  String? hesabinVarMi;
  String? adresBilgisi;
  String? telefonBilgisi;
  String? vergiBilgisi;

  Tr(
      {this.girisYap,
      this.kaydol,
      this.slogan,
      this.mail,
      this.sifre,
      this.anyAccount,
      this.firmaAdi,
      this.yetkiliAdSoyad,
      this.adres,
      this.telefon,
      this.basliklardaAra,
      this.hesapOzeti,
      this.bakiye,
      this.hizliIslemMenusu,
      this.tahsilatEkle,
      this.odemeEkle,
      this.cekSenet,
      this.satisGiris,
      this.gunuGelen,
      this.gunuGecen,
      this.teklif,
      this.stok,
      this.stokIhtiyac,
      this.siparis,
      this.cariListesi,
      this.cariListesiniGormekIcinTiklayin,
      this.adet,
      this.kapaliOnarimlar,
      this.tahsilatiYapilmayanOnarimlar,
      this.oncekiOnarimlar,
      this.silinenKabulListesi,
      this.tahsilatListesi,
      this.bugunYapilacakTahsilatlar,
      this.odemeListesi,
      this.bugunYapilacakOdemeler,
      this.butunAlacaklarOdemeler,
      this.stokListesi,
      this.orjinalStokListesi,
      this.satisIslemi,
      this.alisIslemi,
      this.satisEvrakListesi,
      this.alisEvrakListesi,
      this.gelenFatura,
      this.gidenFatura,
      this.gidenEIrsaliye,
      this.alinanSiparisGirisi,
      this.alinanSiparisListesi,
      this.verilenSiparisGirisi,
      this.verilenSiparisListesi,
      this.servisIslemleri,
      this.finansIslemleri,
      this.stokIslemleri,
      this.alimSatimIslemleri,
      this.eIslemler,
      this.siparisIslemleri,
      this.plakaCariVsArama,
      this.baslangic,
      this.bitis,
      this.goster,
      this.ekstra,
      this.detay,
      this.alacakVerecek,
      this.makbuzNo,
      this.cariAdi,
      this.tarihSec,
      this.tutar,
      this.aciklama,
      this.ara,
      this.stokNoyaGoreAra,
      this.stokAdinaGoreAra,
      this.fiyati,
      this.rafYeri,
      this.faturaTipi,
      this.kdvTipi,
      this.vergiNo,
      this.vergiDairesi,
      this.gsm,
      this.stokNumarasi,
      this.stokAdi,
      this.miktar,
      this.fiyat,
      this.ist,
      this.kdv,
      this.toplam,
      this.kaydet,
      this.ekle,
      this.tarih,
      this.verilenCek,
      this.verilenSenet,
      this.alinanCek,
      this.alinanSenet,
      this.verilenCekSenet,
      this.alinanCekSenet,
      this.alinanVerilenCekSenet,
      this.stokNoGirin,
      this.urunAdiGirin,
      this.ihtiyacAdedi,
      this.mevcut,
      this.stokIhtiyacRaporu,
      this.alinanVerilenSiparis,
      this.hesap,
      this.ayarlar,
      this.dilSeciniz,
      this.turkce,
      this.ingilizce,
      this.almanca,
      this.rusca,
      this.flemenkce,
      this.dilSecimiBasariylaGerceklestirildi,
      this.cikisYap,
      this.cariyeGoreAramaYapin,
      this.bugunAcilanKabulKartlari,
      this.acikKartlar,
      this.bugunKapatilanKartlar,
      this.hesabinYokMu,
      this.aramayanlisyazdNZ,
      this.ekstre,
      this.alacak,
      this.borc,
      this.guncelBakiyesi,
      this.cariEkstre,
      this.cariDetay,
      this.adresBilgisiBulunamadi,
      this.telefonBilgisiBulunamadi,
      this.vergiBilgisiBulunamadi,
      this.hesabinVarMi,
      this.adresBilgisi,
      this.telefonBilgisi,
      this.vergiBilgisi});

  Tr.fromJson(Map<String, dynamic> json) {
    girisYap = json['girisYap'];
    kaydol = json['kaydol'];
    slogan = json['slogan'];
    mail = json['mail'];
    sifre = json['sifre'];
    anyAccount = json['anyAccount'];
    firmaAdi = json['firmaAdi'];
    yetkiliAdSoyad = json['yetkiliAdSoyad'];
    adres = json['adres'];
    telefon = json['telefon'];
    basliklardaAra = json['basliklardaAra'];
    hesapOzeti = json['hesapOzeti'];
    bakiye = json['bakiye'];
    hizliIslemMenusu = json['hizliIslemMenusu'];
    tahsilatEkle = json['tahsilatEkle'];
    odemeEkle = json['odemeEkle'];
    cekSenet = json['cekSenet'];
    satisGiris = json['satisGiris'];
    gunuGelen = json['gunuGelen'];
    gunuGecen = json['gunuGecen'];
    teklif = json['teklif'];
    stok = json['stok'];
    stokIhtiyac = json['stokIhtiyac'];
    siparis = json['siparis'];
    cariListesi = json['cariListesi'];
    cariListesiniGormekIcinTiklayin = json['cariListesiniGormekIcinTiklayin'];
    adet = json['adet'];
    kapaliOnarimlar = json['kapaliOnarimlar'];
    tahsilatiYapilmayanOnarimlar = json['tahsilatiYapilmayanOnarimlar'];
    oncekiOnarimlar = json['oncekiOnarimlar'];
    silinenKabulListesi = json['silinenKabulListesi'];
    tahsilatListesi = json['tahsilatListesi'];
    bugunYapilacakTahsilatlar = json['bugunYapilacakTahsilatlar'];
    odemeListesi = json['odemeListesi'];
    bugunYapilacakOdemeler = json['bugunYapilacakOdemeler'];
    butunAlacaklarOdemeler = json['butunAlacaklarOdemeler'];
    stokListesi = json['stokListesi'];
    orjinalStokListesi = json['orjinalStokListesi'];
    satisIslemi = json['satisIslemi'];
    alisIslemi = json['alisIslemi'];
    satisEvrakListesi = json['satisEvrakListesi'];
    alisEvrakListesi = json['alisEvrakListesi'];
    gelenFatura = json['gelenFatura'];
    gidenFatura = json['gidenFatura'];
    gidenEIrsaliye = json['gidenEIrsaliye'];
    alinanSiparisGirisi = json['alinanSiparisGirisi'];
    alinanSiparisListesi = json['alinanSiparisListesi'];
    verilenSiparisGirisi = json['verilenSiparisGirisi'];
    verilenSiparisListesi = json['verilenSiparisListesi'];
    servisIslemleri = json['servisIslemleri'];
    finansIslemleri = json['finansIslemleri'];
    stokIslemleri = json['stokIslemleri'];
    alimSatimIslemleri = json['alimSatimIslemleri'];
    eIslemler = json['eIslemler'];
    siparisIslemleri = json['siparisIslemleri'];
    plakaCariVsArama = json['plakaCariVsArama'];
    baslangic = json['baslangic'];
    bitis = json['bitis'];
    goster = json['goster'];
    ekstra = json['ekstra'];
    detay = json['detay'];
    alacakVerecek = json['alacakVerecek'];
    makbuzNo = json['makbuzNo'];
    cariAdi = json['cariAdi'];
    tarihSec = json['tarihSec'];
    tutar = json['tutar'];
    aciklama = json['aciklama'];
    ara = json['ara'];
    stokNoyaGoreAra = json['stokNoyaGoreAra'];
    stokAdinaGoreAra = json['stokAdinaGoreAra'];
    fiyati = json['fiyati'];
    rafYeri = json['rafYeri'];
    faturaTipi = json['faturaTipi'];
    kdvTipi = json['kdvTipi'];
    vergiNo = json['vergiNo'];
    vergiDairesi = json['vergiDairesi'];
    gsm = json['gsm'];
    stokNumarasi = json['stokNumarasi'];
    stokAdi = json['stokAdi'];
    miktar = json['miktar'];
    fiyat = json['fiyat'];
    ist = json['ist'];
    kdv = json['kdv'];
    toplam = json['toplam'];
    kaydet = json['kaydet'];
    ekle = json['ekle'];
    tarih = json['tarih'];
    verilenCek = json['verilenCek'];
    verilenSenet = json['verilenSenet'];
    alinanCek = json['alinanCek'];
    alinanSenet = json['alinanSenet'];
    verilenCekSenet = json['verilenCekSenet'];
    alinanCekSenet = json['alinanCekSenet'];
    alinanVerilenCekSenet = json['alinanVerilenCekSenet'];
    stokNoGirin = json['stokNoGirin'];
    urunAdiGirin = json['urunAdiGirin'];
    ihtiyacAdedi = json['ihtiyacAdedi'];
    mevcut = json['mevcut'];
    stokIhtiyacRaporu = json['stokIhtiyacRaporu'];
    alinanVerilenSiparis = json['alinanVerilenSiparis'];
    hesap = json['hesap'];
    ayarlar = json['ayarlar'];
    dilSeciniz = json['dilSeciniz'];
    turkce = json['turkce'];
    ingilizce = json['ingilizce'];
    almanca = json['almanca'];
    rusca = json['rusca'];
    flemenkce = json['flemenkce'];
    dilSecimiBasariylaGerceklestirildi =
        json['dilSecimiBasariylaGerceklestirildi'];
    cikisYap = json['cikisYap'];
    cariyeGoreAramaYapin = json['cariyeGoreAramaYapin'];
    bugunAcilanKabulKartlari = json['bugunAcilanKabulKartlari'];
    acikKartlar = json['acikKartlar'];
    bugunKapatilanKartlar = json['bugunKapatilanKartlar'];
    hesabinYokMu = json['hesabinYokMu'];
    aramayanlisyazdNZ = json['aramayanlisyazdınız'];
    ekstre = json['ekstre'];
    alacak = json['alacak'];
    borc = json['borc'];
    guncelBakiyesi = json['guncelBakiyesi'];
    cariEkstre = json['cariEkstre'];
    cariDetay = json['cariDetay'];
    adresBilgisiBulunamadi = json['adresBilgisiBulunamadi'];
    telefonBilgisiBulunamadi = json['telefonBilgisiBulunamadi'];
    vergiBilgisiBulunamadi = json['vergiBilgisiBulunamadi'];
    hesabinVarMi = json['hesabinVarMi'];
    adresBilgisi = json['adresBilgisi'];
    telefonBilgisi = json['telefonBilgisi'];
    vergiBilgisi = json['vergiBilgisi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['girisYap'] = girisYap;
    data['kaydol'] = kaydol;
    data['slogan'] = slogan;
    data['mail'] = mail;
    data['sifre'] = sifre;
    data['anyAccount'] = anyAccount;
    data['firmaAdi'] = firmaAdi;
    data['yetkiliAdSoyad'] = yetkiliAdSoyad;
    data['adres'] = adres;
    data['telefon'] = telefon;
    data['basliklardaAra'] = basliklardaAra;
    data['hesapOzeti'] = hesapOzeti;
    data['bakiye'] = bakiye;
    data['hizliIslemMenusu'] = hizliIslemMenusu;
    data['tahsilatEkle'] = tahsilatEkle;
    data['odemeEkle'] = odemeEkle;
    data['cekSenet'] = cekSenet;
    data['satisGiris'] = satisGiris;
    data['gunuGelen'] = gunuGelen;
    data['gunuGecen'] = gunuGecen;
    data['teklif'] = teklif;
    data['stok'] = stok;
    data['stokIhtiyac'] = stokIhtiyac;
    data['siparis'] = siparis;
    data['cariListesi'] = cariListesi;
    data['cariListesiniGormekIcinTiklayin'] = cariListesiniGormekIcinTiklayin;
    data['adet'] = adet;
    data['kapaliOnarimlar'] = kapaliOnarimlar;
    data['tahsilatiYapilmayanOnarimlar'] = tahsilatiYapilmayanOnarimlar;
    data['oncekiOnarimlar'] = oncekiOnarimlar;
    data['silinenKabulListesi'] = silinenKabulListesi;
    data['tahsilatListesi'] = tahsilatListesi;
    data['bugunYapilacakTahsilatlar'] = bugunYapilacakTahsilatlar;
    data['odemeListesi'] = odemeListesi;
    data['bugunYapilacakOdemeler'] = bugunYapilacakOdemeler;
    data['butunAlacaklarOdemeler'] = butunAlacaklarOdemeler;
    data['stokListesi'] = stokListesi;
    data['orjinalStokListesi'] = orjinalStokListesi;
    data['satisIslemi'] = satisIslemi;
    data['alisIslemi'] = alisIslemi;
    data['satisEvrakListesi'] = satisEvrakListesi;
    data['alisEvrakListesi'] = alisEvrakListesi;
    data['gelenFatura'] = gelenFatura;
    data['gidenFatura'] = gidenFatura;
    data['gidenEIrsaliye'] = gidenEIrsaliye;
    data['alinanSiparisGirisi'] = alinanSiparisGirisi;
    data['alinanSiparisListesi'] = alinanSiparisListesi;
    data['verilenSiparisGirisi'] = verilenSiparisGirisi;
    data['verilenSiparisListesi'] = verilenSiparisListesi;
    data['servisIslemleri'] = servisIslemleri;
    data['finansIslemleri'] = finansIslemleri;
    data['stokIslemleri'] = stokIslemleri;
    data['alimSatimIslemleri'] = alimSatimIslemleri;
    data['eIslemler'] = eIslemler;
    data['siparisIslemleri'] = siparisIslemleri;
    data['plakaCariVsArama'] = plakaCariVsArama;
    data['baslangic'] = baslangic;
    data['bitis'] = bitis;
    data['goster'] = goster;
    data['ekstra'] = ekstra;
    data['detay'] = detay;
    data['alacakVerecek'] = alacakVerecek;
    data['makbuzNo'] = makbuzNo;
    data['cariAdi'] = cariAdi;
    data['tarihSec'] = tarihSec;
    data['tutar'] = tutar;
    data['aciklama'] = aciklama;
    data['ara'] = ara;
    data['stokNoyaGoreAra'] = stokNoyaGoreAra;
    data['stokAdinaGoreAra'] = stokAdinaGoreAra;
    data['fiyati'] = fiyati;
    data['rafYeri'] = rafYeri;
    data['faturaTipi'] = faturaTipi;
    data['kdvTipi'] = kdvTipi;
    data['vergiNo'] = vergiNo;
    data['vergiDairesi'] = vergiDairesi;
    data['gsm'] = gsm;
    data['stokNumarasi'] = stokNumarasi;
    data['stokAdi'] = stokAdi;
    data['miktar'] = miktar;
    data['fiyat'] = fiyat;
    data['ist'] = ist;
    data['kdv'] = kdv;
    data['toplam'] = toplam;
    data['kaydet'] = kaydet;
    data['ekle'] = ekle;
    data['tarih'] = tarih;
    data['verilenCek'] = verilenCek;
    data['verilenSenet'] = verilenSenet;
    data['alinanCek'] = alinanCek;
    data['alinanSenet'] = alinanSenet;
    data['verilenCekSenet'] = verilenCekSenet;
    data['alinanCekSenet'] = alinanCekSenet;
    data['alinanVerilenCekSenet'] = alinanVerilenCekSenet;
    data['stokNoGirin'] = stokNoGirin;
    data['urunAdiGirin'] = urunAdiGirin;
    data['ihtiyacAdedi'] = ihtiyacAdedi;
    data['mevcut'] = mevcut;
    data['stokIhtiyacRaporu'] = stokIhtiyacRaporu;
    data['alinanVerilenSiparis'] = alinanVerilenSiparis;
    data['hesap'] = hesap;
    data['ayarlar'] = ayarlar;
    data['dilSeciniz'] = dilSeciniz;
    data['turkce'] = turkce;
    data['ingilizce'] = ingilizce;
    data['almanca'] = almanca;
    data['rusca'] = rusca;
    data['flemenkce'] = flemenkce;
    data['dilSecimiBasariylaGerceklestirildi'] =
        dilSecimiBasariylaGerceklestirildi;
    data['cikisYap'] = cikisYap;
    data['cariyeGoreAramaYapin'] = cariyeGoreAramaYapin;
    data['bugunAcilanKabulKartlari'] = bugunAcilanKabulKartlari;
    data['acikKartlar'] = acikKartlar;
    data['bugunKapatilanKartlar'] = bugunKapatilanKartlar;
    data['hesabinYokMu'] = hesabinYokMu;
    data['aramayanlisyazdınız'] = aramayanlisyazdNZ;
    data['ekstre'] = ekstre;
    data['alacak'] = alacak;
    data['borc'] = borc;
    data['guncelBakiyesi'] = guncelBakiyesi;
    data['cariEkstre'] = cariEkstre;
    data['cariDetay'] = cariDetay;
    data['adresBilgisiBulunamadi'] = adresBilgisiBulunamadi;
    data['telefonBilgisiBulunamadi'] = telefonBilgisiBulunamadi;
    data['vergiBilgisiBulunamadi'] = vergiBilgisiBulunamadi;
    data['hesabinVarMi'] = hesabinVarMi;
    data['adresBilgisi'] = adresBilgisi;
    data['telefonBilgisi'] = telefonBilgisi;
    data['vergiBilgisi'] = vergiBilgisi;
    return data;
  }
}
