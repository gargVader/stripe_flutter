// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MemberCountLibraryGenerator
// **************************************************************************

import "utils.dart";

class BalanceApi {
  // Returns an object containing your available and pending balance, as well as the time at which it was computed.
  void get__v1_balance() async {
    Utils.makeHTTPRequest("/v1/balance", "GET");
  }
}

class BalanceTransactionsApi {
  // A dictionary with a data property that contains an array of up to limit transactions, starting after transaction starting_after. Each entry in the array is a separate transaction history object. If no more transactions are available, the resulting array will be empty.
  void get__v1_balance_transactions() async {
    Utils.makeHTTPRequest("/v1/balance_transactions", "GET");
  }

  // Returns a balance transaction if a valid balance transaction ID was provided. Returns an error otherwise.
  void get__v1_balance_transactions_id(String id) async {
    Utils.makeHTTPRequest("/v1/balance_transactions/$id", "GET");
  }
}
