class Exercise < ApplicationRecord
  # Direct associations

  belongs_to :bodypart

  has_many   :circuits,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
