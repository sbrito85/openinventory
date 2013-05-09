class Rackitem < ActiveRecord::Base
  attr_accessible :asset_id, :comments, :ipaddress, :position, :serverrack_id, :unitsize, :rackasset

  belongs_to :asset
  belongs_to :serverrack

  before_save { |rackitem|
    asset_name = rackitem.rackasset

    if Asset.where("asset = ?", asset_name ).exists?
      rackitem.asset_id = Asset.find(Asset.where("asset = ?", asset_name ).first).id
    end
  }
  before_update { |rackitem|
    asset_name = rackitem.rackasset

    if Asset.where("asset = ?", asset_name ).exists?
      rackitem.asset_id = Asset.find(Asset.where("asset = ?", asset_name ).first).id
      update_column(:asset_id, rackitem.asset_id)
    else
      update_column(:asset_id,0)
    end
  }
end
