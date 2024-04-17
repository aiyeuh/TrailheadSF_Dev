import { LightningElement, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import Id from "@salesforce/user/Id";
import NAME_FIELD from "@salesforce/schema/User.Name";

const fields = [NAME_FIELD];

export default class Selector extends LightningElement {
  selectedProductId;

  handleProductSelected(evt) {
    this.selectedProductId = evt.detail;
  }
  UserId = Id;
  //wire for brings data
  @wire(getRecord, { recordId: "$UserId", fields })
  user;
  get name() {
    return getFieldValue(this.user.Id, NAME_FIELD);
  }
}
