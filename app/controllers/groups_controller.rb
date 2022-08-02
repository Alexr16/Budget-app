class GroupsController < ApplicationController
  before_action :authenticate_user!
    def index
      @user = current_user
      @groups = @user.groups
    end
  
    def new
      @group = Group.new
    end

    def create
      @user = current_user
      @group = @user.groups.new(group_params)
      @group.author_id = @user.id
      if @group.save
        flash[:notice] = 'Group successfully created!'
        redirect_to user_groups_path(current_user)
      else
        flash[:notice] = 'Group not created!'
        render :new
      end
    end

    private

    def group_params 
      params.require(:group).permit(:name, :icon)
    end
  end