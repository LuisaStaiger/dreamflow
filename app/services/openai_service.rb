class OpenaiService
  def self.transcribe(audio_input)
    # Assuming OpenAI's API can process audio files directly
    Rails.cache.fetch("#{audio_input}") do
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
          model: "whisper-1",  # Assuming 'whisper-1' is an audio processing model
          audio: audio_input   # Send the audio file
        }
      )
      response["choices"][0]["message"]["content"]
    end
  end
end

"../../../../../Desktop/Granny Dream.mp3"
