
import 'package:rxdart/subjects.dart';
import 'package:vip1/models/vipModel.dart';
import 'package:vip1/services/vipProvider.dart';

class VipBloc {
  final BehaviorSubject<VipModel> _subject =
  BehaviorSubject<VipModel>();

  getList() async {

    VipModel response = await VipProvider().all();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<VipModel> get subject => _subject;
}
final blocVip = VipBloc();