class TrascriptionsDuration < ActiveRecord::Migration[7.2]
  def change
    add_column :transcripts, :duration_seconds, :integer
  end
end
