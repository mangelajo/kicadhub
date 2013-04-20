class AddAttachmentFileToPcbs < ActiveRecord::Migration
  def self.up
    change_table :pcbs do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :pcbs, :file
  end
end
