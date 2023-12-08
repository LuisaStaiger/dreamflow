import { Controller } from "@hotwired/stimulus"
import AudioRecorder from 'audio-recorder-polyfill'
window.MediaRecorder = AudioRecorder

export default class extends Controller {
  static targets = ["transcribedText", "recordButton", "submitButton"]

  connect() {
    this.isRecording = false;
    this.mediaRecorder = null;
    this.audioChunks = [];
  }

  toggleRecording(e) {
    e.preventDefault();
    if (!this.isRecording) {
      navigator.mediaDevices.getUserMedia({ audio: true })
      .then(stream => {
        this.mediaRecorder = new MediaRecorder(stream);

        this.mediaRecorder.addEventListener('dataavailable', e => {
          console.log("data is available")
          this.audioChunks.push(e.data)
        })

        this.mediaRecorder.addEventListener('stop', e => {
          this.sendAudioToServer()
        })

        this.mediaRecorder.start();

        this.isRecording = true;
        this.recordButtonTarget.innerText = 'Stop Recording';
        })
        .catch(err => console.error("Error accessing microphone:", err));
    } else {
      console.log("👻")
      this.mediaRecorder.stop();
      this.mediaRecorder.stream.getTracks().forEach(track => track.stop())
      this.isRecording = false;
      this.recordButtonTarget.innerText = 'Start Recording';
    }
  }

  sendAudioToServer() {
    const audioBlob = new Blob(this.audioChunks);
    const formData = new FormData();
    formData.append('audio', audioBlob, 'recording.mp4');

    const csrf = document.querySelector('meta[name=csrf-token]').content

    fetch(('/dreams/new_audio'), {
      method: 'POST',
      headers: {
        'X-CSRF-Token': csrf
      },
      body: formData
    }).then(response => response.json())
    .then(data => {
      // console.log("data", data.transcription);
      // console.log("transcript 🐝", this.transcribedTextTarget);
      console.log(this.transcribedTextTargets);
      this.transcribedTextTargets.forEach((transcribedTextTarget) => {
        transcribedTextTarget.value = data.transcription;
      })
    }).catch(err => console.error("Error sending audio to server:", err));
  }
}
