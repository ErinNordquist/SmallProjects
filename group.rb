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

  def get_result
    nil
  end

end
