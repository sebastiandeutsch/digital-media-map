MetaSearch::Where.add :search_filter,
  :formatter => Proc.new {|param| param },
  :validator => Proc.new {|param| param }