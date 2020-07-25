class Project < ApplicationRecord
	include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user }
	
	belongs_to :team
	belongs_to :user

	accepts_nested_attributes_for :team

end
