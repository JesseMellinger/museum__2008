class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    collector = {}
    @patrons.each do |patron|
      @exhibits.each do |exhibit|
        if recommend_exhibits(patron).include?(exhibit) && collector[exhibit]
          collector[exhibit] << patron
        elsif recommend_exhibits(patron).include?(exhibit)
          collector[exhibit] = [patron]
        else
          collector[exhibit] = []
        end
      end
    end
    collector
  end

end
