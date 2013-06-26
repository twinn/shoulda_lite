# -*- encoding : utf-8 -*-

class Model < ActiveRecord::Base
  has_many :activities
  has_one :other_thing  
  has_many :things, through: :something_else
  has_many :awarded_achievements, dependent: :destroy
  validates_presence_of :email
end
