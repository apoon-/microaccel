class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :projects, :through => :pledges

  has_many :discussions
  has_many :projects, :through => :discussions

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
