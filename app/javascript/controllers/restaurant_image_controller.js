import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "output", "input" ]

    replacePhoto() {
      var input = this.inputTarget
      var output = this.outputTarget
      
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function () {
         if (output.classList.contains('hidden-field'))
         {
          output.classList.remove('hidden-field')
         }
         output.src = reader.result
       }
       reader.readAsDataURL(input.files[0]);
     }


     
   }
}
