class Project < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :users, :through => :pledges

  has_many :discussions
  has_many :users, :through => :discussions

  has_many :pledges

end
