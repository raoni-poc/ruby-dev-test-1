# frozen_string_literal: true

class FilesRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file_record, only: [:show, :destroy]
  def index
    current_user = User.first
    @file_records = current_user.file_records.includes(:folders)
    render json: @file_records
  end

  def create
    current_user = User.first
    service = FileRecords::CreateService.new(file_record_params, zip_file, folder)
    @file_record = service.call

    if @file_record
      render json: @file_record, status: :created
    else
      render json: { error: "Erro ao criar arquivo" }, status: :unprocessable_entity
    end
  end

  def show
    current_user = User.first
    render json: @file_record
  end

  def destroy
    current_user = User.first
    service = FileRecords::DestroyService.new(file_record: file_record, folder: folder)
    if service.call
      render json: { message: "Arquivo removido com sucesso." }, status: :ok
    else
      render json: { error: "Não foi possível remover o arquivo." }, status: :unprocessable_entity
    end
  end

  private

  def set_file_record
    current_user = User.first
    @file_record = current_user.file_records.find_by(id: params[:id])

    unless @file_record
      render json: { error: "Arquivo não encontrado" }, status: :not_found
    end
  end

  def file_record_params
    params.require(:file_record).permit(
      :original_name,
      :original_mime_type,
      :size,
      :description,
      :visibility,
      :sha256
    ).merge(owner: current_user)
  end

  def zip_file
    params[:file_record][:zip]
  end

  def folder
    Folder.find_by(id: params[:folder_id])
  end
end
