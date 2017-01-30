class Circle < ActiveRecord::Base
  enum category: { sport: 0, culture: 1 }
end
