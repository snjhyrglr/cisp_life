import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["departmentSelect"];

  change(event) {
    let div_id = event.target.selectedOptions[0].value;
    let target = this.departmentSelectTarget.id;

    get(`/divisions/${div_id}/selected?target=${target}`, {
      responseKind: "turbo-stream",
    });
  }
}
