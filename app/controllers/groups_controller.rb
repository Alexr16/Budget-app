class GroupsController < ApplicationController
  before_action :authenticate_user!
    def index
      @groups = Group.all
    end
  
    def new
      @group = Group.new
    end

    def create
      @user = current_user
      @group = Group.new(group_params)
      @group.author_id = @user.id
      if @group.save
        redirect_to user_groups_path(current_user)
      else
        render :new
      end
    end

    private

    def group_params 
      params.require(:group).permit(:name, :icon)
    end
  end