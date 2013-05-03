class Device < ActiveRecord::Base
  attr_accessible :make, :model, :assettype, :image,:image_file_name,:image_remote_url

  validates :make, presence: true
  validates :assettype, presence: true
  validates :model, presence: true
  validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
  has_many :asset
  has_attached_file :image, styles: { small: "96x96>"}
  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end
  def self.import(file, user_id)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      device = find_by_model(row["model"]) || new
      device.attributes = row.to_hash.slice(*accessible_attributes)
      device.save!
    end  
  end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    #when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
