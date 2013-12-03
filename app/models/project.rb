class Project < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
