class Workout < ApplicationRecord
  # Direct associations

  has_many   :circuits,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
