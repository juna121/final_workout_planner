class Exercise < ApplicationRecord
  # Direct associations

  has_many   :circuits,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
