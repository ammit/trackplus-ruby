# frozen_string_literal: true

# JSONs stolen from official trackplus API

def trackings_json_fixture
  read_fixture('trackings.json')
end

def couriers_json_fixture
  read_fixture('couriers.json')
end

def read_fixture(filename)
  File.read File.expand_path("../fixtures/#{filename}", __FILE__)
end
