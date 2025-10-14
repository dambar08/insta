# frozen_string_literal: true

# Ahoy Matey Configuration
class Ahoy::Store < Ahoy::DatabaseStore
end

Ahoy.server_side_visits = true

# set to true to mask ip address
Ahoy.mask_ips = true

# set to true for JavaScript tracking
Ahoy.api = true

# set to true for geocoding (and add the geocoder gem to your Gemfile)
# we recommend configuring local geocoding as well
# see https://github.com/ankane/ahoy#geocoding
Ahoy.geocode = false

# Ahoy Email Configuration
AhoyEmail.api = false
AhoyEmail.save_token = true
