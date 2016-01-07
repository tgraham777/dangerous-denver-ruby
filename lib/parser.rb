require 'csv'
require_relative 'sorter'

class Parser
  def initialize(filename)
    @filename = filename
  end

  def parse
    neighborhood = []
    address = []
    CSV.foreach(@filename,:headers => true, :header_converters => :symbol, :converters => :numeric) do |row|
      neighborhood << row[:neighborhood_id]
      address << row[:incident_address]
    end

    Sorter.find_sketchiest_locations(neighborhood.compact)
    Sorter.find_sketchiest_locations(address.compact)
  end
end
