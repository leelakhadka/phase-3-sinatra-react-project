class Registration < ActiveRecord::Base
    belongs_to :student
    belongs_to :dance_class
end