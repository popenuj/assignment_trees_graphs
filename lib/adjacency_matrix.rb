require_relative 'edge_list'

# info = Struct.new(:name, :id, :weight, :relationships)
class Info
  def initialize
    @relationships = Array.new(20)
    header = [info("Bob", 0), info("Harry", 1), info("Alice", 2)]
# Harry = [nil, nil, nil, nil, nil, nil, nil, nil, nil, , nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end
end

class AdjacencyMatrix
  # name = Info.new()
  def initialize
    @header_array = header_array
  end
  def header_array
    header = []
    EDGE_LIST.each do |record|
      person0, person1 = record[0], record[1]
      header.push(person0) unless header.include?(person0)
      header.push(person1) unless header.include?(person1)
    end
    header
  end
  def adjacency_matrix
    rows = []
    blank_row = Array.new(20)
    EDGE_LIST.each do |record|
      person = record[0]
      rows.push(blank_row.dup[0] = person) unless rows.include?(person)
      relation = record[1]
      row = rows.find_index(person)
      column = @header_array.find_index(relation)
      p rows
      rows[row][column] = record[2]
    end
    rows
  end
end
