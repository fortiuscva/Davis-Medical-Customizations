tableextension 52601 "DME Purch. Rcpt. Header" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(52600; "DME Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
        }
    }
}
