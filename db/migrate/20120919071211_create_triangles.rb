class CreateTriangles < ActiveRecord::Migration
  def change
    create_table :triangles do |t|

      t.timestamps
    end
  end
end
