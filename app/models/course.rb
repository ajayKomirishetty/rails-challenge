class Course < ApplicationRecord
  has_many :lessons, autosave: true
  has_many :assignments, autosave: true
end
