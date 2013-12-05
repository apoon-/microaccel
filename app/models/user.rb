class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: "Project" 
  has_many :pledges

  has_many :projects, through: :pledges

  has_many :discussions 

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
