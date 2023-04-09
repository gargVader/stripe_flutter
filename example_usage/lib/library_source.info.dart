// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MemberCountLibraryGenerator
// **************************************************************************

import "utils.dart";

class BalanceApi {
  void get__v1_balance() async {
    Utils.makeHTTPRequest("/v1/balance", "GET");
  }
}

class ChargesApi {
  void post__v1_charges(int amount, String currency) async {
    Utils.makeHTTPRequest("/v1/charges", "POST");
  }
}
