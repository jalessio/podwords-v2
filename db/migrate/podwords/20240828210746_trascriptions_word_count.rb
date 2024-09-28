class TrascriptionsWordCount < ActiveRecord::Migration[7.2]
  def change
    add_column :transcripts, :word_count, :integer
  end
end
