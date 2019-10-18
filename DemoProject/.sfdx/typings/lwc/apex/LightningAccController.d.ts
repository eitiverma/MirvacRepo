declare module "@salesforce/apex/LightningAccController.getAccounts" {
  export default function getAccounts(): Promise<any>;
}
declare module "@salesforce/apex/LightningAccController.saveAccount" {
  export default function saveAccount(param: {acc: any}): Promise<any>;
}
declare module "@salesforce/apex/LightningAccController.updateAccount" {
  export default function updateAccount(param: {acc: any}): Promise<any>;
}
declare module "@salesforce/apex/LightningAccController.delAccount" {
  export default function delAccount(param: {selectedacc: any}): Promise<any>;
}
declare module "@salesforce/apex/LightningAccController.AddNewRow" {
  export default function AddNewRow(param: {lstAccWrap: any}): Promise<any>;
}
