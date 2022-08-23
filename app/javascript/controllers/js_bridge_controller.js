import { Controller } from "@hotwired/stimulus"
import domtoimage from 'dom-to-image';
export default class extends Controller {


    openCamera() {
        NativeMessageHandler.post('openCamera', JSON.stringify({ key: "camera tetiklendi" }))

    }
}
