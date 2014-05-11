class Todo < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
