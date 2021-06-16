import 'package:bloc_example/service/model/biography_model.dart';
import 'package:bloc_example/service/model/raw_data_set.dart';
import 'package:bloc_example/theme/color.dart';

class BiographyRepository {
  Future<BiographyModel> getBiography() async {
    return BiographyModel(
        name: 'Joachim Löw',
        nickName: '#NicJon680305',
        avatar:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Joachim_L%C3%B6w_2006.jpg/220px-Joachim_L%C3%B6w_2006.jpg",
        age: 61,
        clubLogo:
            "https://upload.wikimedia.org/wikipedia/en/5/50/Logo_adanaspor.png",
        countryLogo:
            "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",
        education: "UEFA Pro",
        level: 'Nat Pro',
        fans: 200,
        follow: 1000,
        friends: 50,
        introduce:
            'Joachim Löw is a German football coach and former player. He is the head coach of the Germany national team, which he led to victory at the 2014 FIFA World Cup in Brazil and the 2017 FIFA Confederations Cup in Russia. On 9 March 2021, Löw announced that he will resign from his position after Euro 2020',
        position: 'Coach');
  }

  Future<List<RawDataSet>> getDataSet() async {
    return [
      RawDataSet(
        title: 'Average',
        color: AppColor.white,
        values: [50, 50, 50, 50, 50, 50],
      ),
      RawDataSet(
        title: 'You',
        color: AppColor.greenAccent,
        values: [100, 100, 100, 100, 100, 100],
      ),
    ];
  }
}
