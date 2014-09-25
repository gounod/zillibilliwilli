# encoding: utf-8

class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:state].present?
      @discussions = Discussion.where(:state => params[:state])
    else
      @discussions = Discussion.all
    end
    respond_with(@discussions)
  end

  def show
    respond_with(@discussion)
  end

  def new
    @discussion = Discussion.new
    respond_with(@discussion)
  end

  def edit
  end

  def create
    @discussion = Discussion.new(discussion_params)
    if current_user.present?
      @discussion.user = current_user
    end
    @discussion.state = "opened"
    @discussion.save
    respond_with(@discussion)
  end

  def update
    @discussion.update(discussion_params)
    respond_with(@discussion)
  end

  def destroy
    @discussion.destroy
    respond_with(@discussion)
  end

  private
    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    def discussion_params
      params.require(:discussion).permit(:title, :description, :user, :state, :tag_list)
    end
end
