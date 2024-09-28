class TrascriptionsWhisperParams < ActiveRecord::Migration[7.2]
  def change
    add_column :transcripts, :model_size, :string, limit: 50
    add_column :transcripts, :device, :string, limit: 10
    add_column :transcripts, :compute_type, :string, limit: 10
    add_column :transcripts, :language, :string, limit: 2
    add_column :transcripts, :cpu_threads, :integer
    add_column :transcripts, :beam_size, :integer
  end
end
