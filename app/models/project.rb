class Project < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :owner, foreign_key: "user_id"

  has_many :pledges

  has_many :sponsors, through: :pledges, class_name: "User"

  has_many :discussions

end
