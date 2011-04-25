# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_v_session',
  :secret      => '63521348aed0ff464127ffc429a0d951c03de6d3c6d3ede7b198ff12a5c627773bead1ed14b02a55a60119354ca3fb8ebff49a97fc26a26186148861c8a7977b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
