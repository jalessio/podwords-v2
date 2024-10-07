# == Schema Information
#
# Table name: transcripts
#
#  id                       :bigint           not null, primary key
#  beam_size                :integer
#  compute_type             :string(10)
#  cpu_threads              :integer
#  device                   :string(10)
#  language                 :string(2)
#  model_size               :string(50)
#  transcript               :text
#  whisper_duration_seconds :integer
#  word_count               :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  episode_id               :integer
#
# Indexes
#
#  index_transcripts_on_episode_id  (episode_id)
#
class Transcript < ApplicationRecord
  # include MeiliSearch::Rails

  belongs_to :episode
  before_save :word_count

  # meilisearch do
  #   attribute :transcript
  # end

  def word_count
    self.word_count = transcript.split(" ").count
  end

  # TranscriptionInfo(language='en', language_probability=1, duration=662.961625, duration_after_vad=662.961625, all_language_probs=None, transcription_options=TranscriptionOptions(beam_size=5, best_of=5, patience=1, length_penalty=1, repetition_penalty=1, no_repeat_ngram_size=0, log_prob_threshold=-1.0, no_speech_threshold=0.6, compression_ratio_threshold=2.4, condition_on_previous_text=True, prompt_reset_on_temperature=0.5, temperatures=[0.0, 0.2, 0.4, 0.6, 0.8, 1.0], initial_prompt=None, prefix=None, suppress_blank=True, suppress_tokens=[-1], without_timestamps=False, max_initial_timestamp=1.0, word_timestamps=False, prepend_punctuations='"\'"¿([{-', append_punctuations='"\'.。,，!！?？:：")]}、', max_new_tokens=None, clip_timestamps='0', hallucination_silence_threshold=None, hotwords=None), vad_options=None)
  # Segment(id=2, seek=2760, start=np.float64(7.44), end=np.float64(11.54), text=" This is the indicator from Planet Money, I'm Darren Woods.", tokens=[50613, 770, 318, 262, 16916, 422, 11397, 12911, 11, 314, 1101, 26203, 16483, 13, 50963], temperature=0.0, avg_logprob=-0.270281382614658, compression_ratio=1.6021505376344085, no_speech_prob=0.007996496744453907, words=[Word(start=np.float64(7.44), end=np.float64(8.08), word=' This', probability=np.float64(0.7450932264328003)), Word(start=np.float64(8.08), end=np.float64(8.08), word=' is', probability=np.float64(0.9702028036117554)), Word(start=np.float64(8.08), end=np.float64(8.08), word=' the', probability=np.float64(0.449869841337204)), Word(start=np.float64(8.08), end=np.float64(10.16), word=' indicator', probability=np.float64(0.04430520161986351)), Word(start=np.float64(10.16), end=np.float64(10.16), word=' from', probability=np.float64(0.8878297805786133)), Word(start=np.float64(10.16), end=np.float64(10.16), word=' Planet', probability=np.float64(0.5979899764060974)), Word(start=np.float64(10.16), end=np.float64(11.32), word=' Money,', probability=np.float64(0.9910531640052795)), Word(start=np.float64(11.54), end=np.float64(11.54), word=" I'm", probability=np.float64(0.989765852689743)), Word(start=np.float64(11.54), end=np.float64(11.54), word=' Darren', probability=np.float64(0.4548909664154053)), Word(start=np.float64(11.54), end=np.float64(11.54), word=' Woods.', probability=np.float64(0.9524862170219421))])
end
