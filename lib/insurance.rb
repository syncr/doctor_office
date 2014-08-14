require 'pg'

class Insurance
  attr_accessor :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.cost(doctor_id)
    total = 0
    visits = DB.exec("SELECT * FROM appointments WHERE date >= TO_DATE('1950/01/01', 'yyyy/mm/dd') AND date <= TO_DATE('2040/12/31','yyyy/mm/dd') AND doctor_id = #{doctor_id};")
    visits.each do |visit|
      total += visit["cost"].to_i
    end
    p total
  end


end
