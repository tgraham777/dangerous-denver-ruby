class Sorter
  def self.find_sketchiest_locations(array)
    locations = Hash[array.group_by {|x| x}.map { |k,v| [k,v.count] }]
    results = sort_by_occurance(locations)
    puts results[0..4].inspect
  end

  def self.sort_by_occurance(hash)
    hash.sort { |a1, a2| a2[1] <=> a1[1] }
  end
end
