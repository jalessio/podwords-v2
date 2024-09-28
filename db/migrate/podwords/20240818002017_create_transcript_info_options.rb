class CreateTranscriptInfoOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :transcript_info_options do |t|
      # TranscriptionInfo(language='en', language_probability=1, duration=662.961625, duration_after_vad=662.961625, all_language_probs=None, transcription_options=TranscriptionOptions(beam_size=5, best_of=5, patience=1, length_penalty=1, repetition_penalty=1, no_repeat_ngram_size=0, log_prob_threshold=-1.0, no_speech_threshold=0.6, compression_ratio_threshold=2.4, condition_on_previous_text=True, prompt_reset_on_temperature=0.5, temperatures=[0.0, 0.2, 0.4, 0.6, 0.8, 1.0], initial_prompt=None, prefix=None, suppress_blank=True, suppress_tokens=[-1], without_timestamps=False, max_initial_timestamp=1.0, word_timestamps=False, prepend_punctuations='"\'"¿([{-', append_punctuations='"\'.。,，!！?？:：")]}、', max_new_tokens=None, clip_timestamps='0', hallucination_silence_threshold=None, hotwords=None), vad_options=None)
      t.integer :episode_id
      t.references :transcription_info, foreign_key: false, null: false
      t.integer :beam_size, null: false
      t.integer :best_of, null: false
      t.float :patience, null: false
      t.float :length_penalty, null: false
      t.float :repetition_penalty, null: false
      t.integer :no_repeat_ngram_size, null: false
      t.float :log_prob_threshold, null: false
      t.float :no_speech_threshold, null: false
      t.float :compression_ratio_threshold, null: false
      t.boolean :condition_on_previous_text, null: false
      t.float :prompt_reset_on_temperature, null: false
      t.json :temperatures
      t.text :initial_prompt
      t.text :prefix
      t.boolean :suppress_blank, null: false
      t.json :suppress_tokens
      t.boolean :without_timestamps, null: false
      t.float :max_initial_timestamp, null: false
      t.boolean :word_timestamps, null: false
      t.string :prepend_punctuations
      t.string :append_punctuations
      t.integer :max_new_tokens
      t.string :clip_timestamps
      t.float :hallucination_silence_threshold
      t.json :hotwords

      t.timestamps
    end
  end
end
