
class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :topic
      t.string :status, default: "pending"
      t.string :max_gpu
      t.string :min_gpu
      t.string :max_memory
      t.string :min_memory
      t.string :position_x
      t.string :position_y

      t.text :pmml_data_path
      t.text :input_data
      t.string :input_data_path
      t.string :outpu_data_path

      t.string :in_connection
      t.string :out_connection
      t.string :connection_settings

      t.string :service_ip
      t.string :service_port
      t.string :service_full_path

      t.references :resource, foreing_key: true

      t.timestamps
    end
  end
end
