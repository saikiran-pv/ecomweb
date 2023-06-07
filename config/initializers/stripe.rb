require "stripe"

Rails.configuration.stripe = {
  publishable_key: ENV["pk_test_51MjRjASJ4HE8BJRRNnen5BpTsvdCVth3XYLbY3xzJqoXI2jCq0ycXiu2RtdR5hCSuZplFEX0TCwrAchtN61WQSzx00hAixAtSP"],
  secret_key: ENV["sk_test_51MjRjASJ4HE8BJRRqzBwLKqlSBv7ihKgGgdermchUcEAq67zs0FaoeSfUVppTzr4qwerxK7nQfdkTber67AyR4aS00fEd0aLkq"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
