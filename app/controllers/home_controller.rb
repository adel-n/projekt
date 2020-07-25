class HomeController < ApplicationController
  def index
  	if user_signed_in?
  		@teams = Team.where('id in (?)', current_user.team_ids)
  		@projects = Project.where('id in (?)', current_user.project_ids)
  	end
  	@activities = PublicActivity::Activity.where(owner_id: current_user, owner_type: "User").order(created_at: :desc)
  end
end
