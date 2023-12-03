import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer"
export default class extends Controller {

  static targets = ["hidden", "text"]
  connect() {

  }

  readAnswer(){
    console.log(this.textTarget.innerText)
    
  }
}
