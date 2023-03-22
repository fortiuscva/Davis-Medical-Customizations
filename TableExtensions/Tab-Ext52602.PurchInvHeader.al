tableextension 52602 "DME Purch. Inv. Header" extends "Purch. Inv. Header"
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
