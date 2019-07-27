class AddServiceOrderRefToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :serviceorder, index: true
    add_foreign_key :movements, :serviceorders
  end
end
