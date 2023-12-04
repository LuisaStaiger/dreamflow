import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-input"
export default class extends Controller {
  static targets = ["transcribedText", "recordButton", "submitButton"];

  connect() {
    console.log("Stimulus controller connected 👻");
    console.log("textarema", this.transcribedTextTarget);
    console.log("record btn", this.recordButtonTarget);
    console.log("submit btn", this.submitButtonTarget);
    // this.isRecording = false;
    // this.mediaRecorder = null;
    // this.audioChunks = [];

    const savedText = localStorage.getItem('transcribedText');
  }
}
