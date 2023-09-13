
class Init < ActiveRecord::Migration[7.0]
  def up
    create_table :theaters do |t|
      t.string :name, null: false
    end

    create_table :screen_types do |t|
      t.string :name, null: false
    end

    create_table :screens do |t|
      t.integer :number, null: false
      t.references :theater, null: false, foreign_key: true
      t.references :screen_type, null: false, foreign_key: true
    end

    create_table :seats do |t|
      t.integer :prefix, null: false
      t.integer :number, null: false
      t.references :screen, null: false, foreign_key: true
    end

    create_table :movies do |t|
      t.string :title, null: false
      t.text :description, default: ''
    end

    create_table :price_tables do |t|
      t.string :name, null: false
      t.references :screen_type, null: false, foreign_key: true
    end

    create_table :prices do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.references :price_table, null: false, foreign_key: true
    end

    create_table :play_schedules do |t|
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false

      t.references :screen, null: false, foreign_key: true
      t.references :price_table, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
    end

    create_table :tickets do |t|
      t.references :play_schedule, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
    end

    create_table :guests do |t|
      t.string :phone1, null: false
      t.string :phone2, null: false
      t.string :phone3, null: false
      t.string :email, null: false
    end

    create_table :purchases do |t|
      t.references :price, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true
      t.references :guest, null: true, foreign_key: true
    end
  end
end
