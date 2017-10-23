
class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :resource_type, default: "store "
      t.string :docker_image
      t.string :logo_path
      t.timestamps
    end
  end
end