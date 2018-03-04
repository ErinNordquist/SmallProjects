Class Graph

  def initialize
    @nodes = Hash.new
  end

  def add_vertex(v)
    if !@nodes.has_key? v then @nodes[v] = [] end
  end

  def add_edge(from, to) #in the future make it so to can be a list also
    add_vertex from ; add_vertex to
    @nodes[from] = @nodes[from] << to
  end

  def add_undirected_edge(a,b)
    add_vertex a ; add_vertex tb
    @nodes[a] = @nodes[a] << b
    @nodes[b] = @nodes[b] << a
  end
  
end
