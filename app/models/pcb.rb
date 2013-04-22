class Pcb < ActiveRecord::Base
  attr_accessible :description, :title, :file, :preview
  has_attached_file :file
  has_attached_file :preview , :styles => { :thumb => "300x300", :medium => "800x600" }
  has_one :kicadnetlist
  has_many :references , :through => :kicadnetlists
  has_many :assembly_guides
  has_many :reference_prints, :through => :assembly_guides

  after_initialize :check_assembly_guide
  after_initialize :check_preview

  def check_assembly_guide
    if assembly_guides.count.zero? and not kicadnetlist.nil?
      assembly_guides << AssemblyGuide.generate_for_pcb_and_netlist(self,kicadnetlist)
    end

  end

  def check_preview
    if preview_file_name.nil?
      files=%x[/Applications/KiCad/python #{File.join(Rails.root, 'lib','system','preview.py')} #{file.path}].split("\n")

      if files.length > 0
        File.open(files[0]) { |f| self.preview = f }
        self.save!

      end
    end
  end

end
