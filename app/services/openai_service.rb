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
    response['text']
  end

  def self.generate_title(dream_content)
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{  role: "user",
                    content: "Please generate a short title for this #{dream_content}, not longer than 20 character."}]
    })
    return chaptgpt_response["choices"][0]["message"]["content"]

  end
end
