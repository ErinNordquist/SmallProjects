#This program should read in files with statements in the form of
# 1. A can't sit next to B
# 2. A can't sit near B OR
# then maybe A must sit near B OR A must sit next to B
# possibly add in "wants to" and "doesn't want to" later

#Functionality to be added
  # creating 1D seating list
  # creating 2D seating list
require_relative "graph.rb"

Class SeatingChart
  def initialize
    @roster = Graph.new #hash of all students currently in the class pointing to a list of everyone they can't sit with
    @result = []
  end

  def read_in(file) #should support multiple loads
    IO.each_line(file) {|line| if line =~ /^(\w*) can't sit next to (\w*)$/
      then @roster.add_undirected_edge($1,$2)}
  end

  def find_seat(k) #find a spot in result for k
    if @result == [] then @result = [k] else
      lst = @roster.get_neighbors(k)
      i = 0
      #can either try to find a place in the current list, or build a new list
      #around this new k or try the first and do the second if it fails
      while(!@result.include? k || i >= lst.size)
        if !lst.include? @result[i] && (i==lst.size-1||!lst.include? @result[i+1])
          then @result.insert(i+1,k) end
        i++
      end
      @result.include? k #check if k was added, if so - true, otherwise...I will find a solution to that soon.
    end
  end

  def get_result
    @roster.get_node_list.each do |kid|
      if !@result.include? kid then
        #NOT FINISHED
    end
  end

end
