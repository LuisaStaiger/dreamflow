require "openai"

class OpenaiService
  def self.transcribe(audio_path)
    audio_file = File.open(audio_path, "rb")
    client = OpenAI::Client.new

    response = client.audio.transcribe(
      parameters: {
        model: "whisper-1",
        file: File.open(audio_file, "rb")
      })

    p response['text']
  end
end
