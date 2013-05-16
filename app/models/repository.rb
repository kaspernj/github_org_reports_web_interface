class Repository < ActiveRecord::Base
  attr_accessible :login, :name, :password, :user
end
