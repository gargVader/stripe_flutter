// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StripeLibraryGenerator
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

class ChargesApi {
  // Creates a new charge object.
  void post__v1_charges(int amount, String currency) async {
    var body = {
      "amount": amount,
      "currency": currency,
    };

    Utils.makeHTTPRequest("/v1/charges", "POST", body: body.toString());
  }

  // Retrieves the details of a charge that has previously been created. Supply the unique charge ID that was returned from your previous request, and Stripe will return the corresponding charge information. The same information is returned when creating or refunding the charge.
  void get__v1_charges_id(String id) async {
    Utils.makeHTTPRequest("/v1/charges/$id", "GET");
  }

  // Updates the specified charge by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  void post__v1_charges_id(String id) async {
    Utils.makeHTTPRequest("/v1/charges/$id", "POST");
  }

  // Capture the payment of an existing, uncaptured, charge. This is the second half of the two-step payment flow, where first you created a charge with the capture option set to false.
  void post__v1_charges_id_capture(String id) async {
    Utils.makeHTTPRequest("/v1/charges/$id/capture", "POST");
  }

  // Returns a list of charges you’ve previously created. The charges are returned in sorted order, with the most recent charges appearing first.
  void get__v1_charges() async {
    Utils.makeHTTPRequest("/v1/charges", "GET");
  }

  // Search for charges you’ve previously created using Stripe’s Search Query Language.
  void get__v1_charges_search(String query) async {
    var body = {
      "query": query,
    };

    Utils.makeHTTPRequest("/v1/charges/search", "GET", body: body.toString());
  }
}

class CustomersApi {
  //
  void post__v1_customers() async {
    Utils.makeHTTPRequest("/v1/customers", "POST");
  }

  // Retrieves a Customer object.
  void get__v1_customers_id(String id) async {
    Utils.makeHTTPRequest("/v1/customers/$id", "GET");
  }

  // Updates the specified customer by setting the values of the parameters passed. Any parameters not provided will be left unchanged.
  void post__v1_customers_id(String id) async {
    Utils.makeHTTPRequest("/v1/customers/$id", "POST");
  }

  // Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.
  void delete__v1_customers_id(String id) async {
    Utils.makeHTTPRequest("/v1/customers/$id", "DELETE");
  }

  // Returns a list of your customers. The customers are returned sorted by creation date, with the most recent customers appearing first.
  void get__v1_customers() async {
    Utils.makeHTTPRequest("/v1/customers", "GET");
  }

  // Search for customers you’ve previously created using Stripe’s Search Query Language.
  void get__v1_customers_search(String query) async {
    var body = {
      "query": query,
    };

    Utils.makeHTTPRequest("/v1/customers/search", "GET", body: body.toString());
  }
}
