class EpisodeAddAudioDuration < ActiveRecord::Migration[7.2]
  def change
    add_column :episodes, :enclosure_duration, :integer
  end
end
