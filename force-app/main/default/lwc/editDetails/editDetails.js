import { LightningElement, api } from 'lwc';

export default class EditDetails extends LightningElement {

    @api recordId;


    errorMethod(event) {
        let message = event.detail.detail;
        //do some stuff with message to make it more readable
        message = "Algo deu errado";
        this.showToast(TOAST_TITLE_ERROR, message, TOAST_VARIANT_ERROR);
       this.clearEditMode();
    }

    showToast(theTitle, theMessage, theVariant) {
        const event = new ShowToastEvent({
            title: theTitle,
            message: theMessage,
            variant: theVariant
        });
     this.dispatchEvent(event);
    }
}