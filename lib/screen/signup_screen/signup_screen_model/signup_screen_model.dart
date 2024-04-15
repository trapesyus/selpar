import 'package:mobx/mobx.dart';
part 'signup_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class SignUpScreenModel = _SignUpScreenModelBase with _$SignUpScreenModel;

abstract class _SignUpScreenModelBase with Store {
  List<String> servicesItems = const [
    'Servis Türü Seçiniz',
    'Yedek Parça',
    'Mekanik Servis',
    'Hasar Onarım Merkezi',
    'Diğer'
  ];
  List<String> districtItems = const [
    'İlçe Seçiniz',
    'Eryaman',
    'Test',
    'Deneme'
  ];
  List<String> provinceItems = const [
    'İl Seçiniz',
    'Ankara',
    'İstanbul',
    'İzmir'
  ];
}
