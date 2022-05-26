import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["memberSelect"];

  change(event) {
    let branch_id = event.target.selectedOptions[0].value;
    let target = this.memberSelectTarget.id;

    get(`/cooperative_branches/${branch_id}/selected?target=${target}`, {
      responseKind: "turbo-stream",
    });
  }
}
