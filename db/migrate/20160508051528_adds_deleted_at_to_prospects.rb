class AddsDeletedAtToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :deleted_at, :datetime
  end
end
