class Bodypart < ApplicationRecord
  # Direct associations

  has_many   :exercises,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
