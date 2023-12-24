import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum SignStatus { sign, home }

class SignState {
  final Rx<SignStatus> _signStatus = SignStatus.sign.obs;
  SignStatus get signStatus => _signStatus.value;
  set signStatus(value) => _signStatus.value = value;
}
