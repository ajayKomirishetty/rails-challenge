class Assignment < ApplicationRecord
  belongs_to :course, counter_cache: true
end
