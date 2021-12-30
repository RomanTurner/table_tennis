import CheckboxSelectAll from 'stimulus-checkbox-select-all';
import { getMetaValue } from '../helpers';

export default class extends CheckboxSelectAll {
  static targets = ['lead', 'id'];
  static values = { url: String };

  connect() {
    super.connect();
  }

  makeFormData() {
    const id = this.idTargets.find((target) => target.selected).value;

    const formData = new FormData();
    formData.append('[id]', id);
    this.checked.forEach((checkbox) =>
      formData.append('ids[]', checkbox.value)
    );

    return formData;
  }

  addToList() {
    const data = this.makeFormData();
    const configObj = {
      body: data,
      method: 'POST',
      headers: { 'X-CSRF-Token': getMetaValue('csrf-token') },
    };
    void this.handleRequest(configObj);
  }

  handleRequest = async (configObj) => {
    let response = await fetch(this.urlValue, configObj);
    if (response.redirected) {
      this.leadTargets.forEach((lead) => (lead.checked = false));
      window.location.href = response.url;
    }
  };

  removeFromList() {
    const data = this.makeFormData();
    const id = this.idTargets.find((target) => target.selected).value;
    data.append('[list_id]', id);
    const configObj = {
      body: data,
      method: 'PATCH',
      headers: { 'X-CSRF-Token': getMetaValue('csrf-token') },
    };

    void this.handleRequest(configObj);
  }
}
