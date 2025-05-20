# frozen_string_literal: true

class FoldersController < ApplicationController
  def index
    current_user = User.first
    render json: Folder.where(owner: current_user)
  end

  def create
    current_user = User.first
    Folder.new(params)
  end

  def show
    current_user = User.first
    Folder.find_by(id: params[:id], owner: current_user).first
  end

  def update
    current_user = User.first
    folder = Folder.find_by(id: params[:id], owner: current_user).first
    folder.update(params)
  end

  def destroy
    current_user = User.first
    folder = Folder.find_by(id: params[:id], owner: current_user).first
    folder.destroy
  end
end
