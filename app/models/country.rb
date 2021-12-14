class Country
  
  attr_reader :name, :continent
  def initialize(name: nil, continent: nil)
    @name = name
    @continent = continent
  end

  def self.all
    response = Faraday.get 'http://172.24.0.1:3000/api/v1/countries'
    countries = JSON.parse(response.body, symbolize_names: true)
    countries.map do |country|
      new(name: country[:name], continent: country[:continent])
    end
  end
end
