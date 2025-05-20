# frozen_string_literal: true

class FileRecordsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_file_record, only: [:show, :destroy]

  include Pagy::Backend

  def index
    file_records = FileRecord.all
    paginated = paginate(file_records, params)
    render json: FileRecordSerializer.new(
      paginated,
      meta: pagination_meta(@pagy),
      links: pagination_links(@pagy)
    ).serializable_hash
  end

  def create
    file_record = FileRecords::CreateService.call(params)

    if file_record.persisted?
      render json: FileRecordSerializer.new(
        file_record,
      ).serializable_hash, status: :created
    else
      render json: {'erros': file_record.errors}, status: :unprocessable_entity
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
