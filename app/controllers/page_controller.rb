# encoding: utf-8

class PageController < ApplicationController
  before_action :authenticate_user!, :only => [:gallery]
  def start
  end

  def contact
  end

  def imprint
  end

  def gallery
    @gallery = Upload.order("created_at DESC").page(params[:page]).per(12)
  end
end
