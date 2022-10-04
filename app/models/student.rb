class Student < ActiveRecord::Base
    has_many :registrations
    has_many :dance_classes, through: :registrations
end