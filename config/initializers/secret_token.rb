# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Agitracker::Application.config.secret_token = ENV['RAILS_SECRET']
Agitracker::Application.config.secret_key_base = "e5202dac23c5ee2f6dfb3600e815070c9f26a79b075620621899178213b710ff7d09499db01baa4731b2d1ace60f51ee50b9d9cd6e42fc7125081520a0caf963"
