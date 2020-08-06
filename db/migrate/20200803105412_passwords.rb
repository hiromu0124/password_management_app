class Passwords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :app_name
      t.string :app_url
      t.string :password,  unique:true
      t.string :terms1  
      t.string :terms2  
      t.string :terms3  
      t.string :terms4  
      t.timestamps 
    end
  end
end
