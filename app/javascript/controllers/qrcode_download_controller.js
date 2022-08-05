import { Controller } from "@hotwired/stimulus"
import domtoimage from 'dom-to-image';
export default class extends Controller {
  static targets = [ "output"]

  downloadQRCode() {
    var output = this.outputTarget
    domtoimage.toJpeg(output, { quality: 0.95 })
      .then(function (dataUrl) {
          var link = document.createElement('a');
          link.download = 'myRestaurantQrCode.jpeg';
          link.href = dataUrl;
          link.click();
      });
  }
}
