class AddAttachmentFileToReferencePrints < ActiveRecord::Migration
  def self.up
    change_table :reference_prints do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :reference_prints, :file
  end
end
