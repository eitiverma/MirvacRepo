declare module "@salesforce/apex/searchController.fetchObjectNames" {
  export default function fetchObjectNames(): Promise<any>;
}
declare module "@salesforce/apex/searchController.fetchRecords" {
  export default function fetchRecords(param: {searchKeyword: any, strWrapper: any}): Promise<any>;
}
