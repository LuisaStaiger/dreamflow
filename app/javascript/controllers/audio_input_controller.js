import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="audio-input"
export default class extends Controller {
  static targets = ["transcribedText", "recordButton", "submitButton"];

  connect() {
    console.log("Stimulus controller connected 👻");
    this.isRecording = false;
    this.mediaRecorder = null;
    this.audioChunks = [];

    // Retrieve and set the textarea content from localStorage if available and not just whitespace
    const savedText = localStorage.getItem('transcribedText');
    if (savedText && savedText.trim().length > 0 && this.hasTranscribedTextTarget) {
      this.transcribedTextTarget.value = savedText.trim();
      this.submitButtonTarget.disabled = false;
    } else {
      localStorage.removeItem('transcribedText'); // Clear whitespace or empty strings
      this.submitButtonTarget.disabled = true;
      this.transcribedTextTarget.value = "";
    }

    // Listen to changes in the textarea and update localStorage and button visibility
    if (this.hasTranscribedTextTarget) {
      this.transcribedTextTarget.addEventListener('input', () => {
        const textValue = this.transcribedTextTarget.value;
        if (textValue.trim().length > 0) {
          localStorage.setItem('transcribedText', textValue);
          this.submitButtonTarget.disabled = false;
        } else {
          localStorage.removeItem('transcribedText');
          this.submitButtonTarget.disabled = true;
        }
      });
    }
  }

  submitReviewedText() {
    // Submit POST Request
  }
}
