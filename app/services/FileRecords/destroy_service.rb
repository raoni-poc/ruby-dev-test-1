module FileRecords
  class DestroyService
    attr_reader :file_record, :folder, :hard_delete

    def initialize(file_record, folder)
      @file_record = file_record
      @folder = folder
    end

    def call
      return false unless file_record.folders.include?(folder)

      if file_record.folders.count > 1
        # O arquivo está em outras pastas: remover apenas a relação
        return file_record.folders.destroy(folder)
      else
        # O arquivo só existe nesta pasta: apagar completamente
        file_record.zip.purge if hard_delete && file_record.zip.attached?
        return file_record.destroy
      end
    end
  end
end
