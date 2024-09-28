class CreateTranscriptInfos < ActiveRecord::Migration[7.2]
  def change
    create_table :transcript_infos do |t|
      # TranscriptionInfo(language='en', language_probability=1, duration=662.961625, duration_after_vad=662.961625, all_language_probs=None, transcription_options=TranscriptionOptions(beam_size=5, best_of=5, patience=1, length_penalty=1, repetition_penalty=1, no_repeat_ngram_size=0, log_prob_threshold=-1.0, no_speech_threshold=0.6, compression_ratio_threshold=2.4, condition_on_previous_text=True, prompt_reset_on_temperature=0.5, temperatures=[0.0, 0.2, 0.4, 0.6, 0.8, 1.0], initial_prompt=None, prefix=None, suppress_blank=True, suppress_tokens=[-1], without_timestamps=False, max_initial_timestamp=1.0, word_timestamps=False, prepend_punctuations='"\'"¿([{-', append_punctuations='"\'.。,，!！?？:：")]}、', max_new_tokens=None, clip_timestamps='0', hallucination_silence_threshold=None, hotwords=None), vad_options=None)
      t.integer :episode_id
      t.string :language, null: false
      t.float :language_probability, null: false
      t.float :duration, null: false
      t.float :duration_after_vad, null: false
      t.json :all_language_probs
      t.json :vad_options
      t.timestamps
    end
  end
end
