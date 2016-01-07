require 'csv'
require_relative 'sorter'

class Parser
  def initialize(filename)
    @filename = filename
  end

  def parse
    neighborhood = []
    CSV.foreach(@filename,:headers => true, :header_converters => :symbol) do |row|
      neighborhood << row[:neighborhood_id]
    end

    Sorter.find_sketchiest_locations(neighborhood.compact)
  end
end
