tableextension 52604 "DME Purchase Header Archive" extends "Purchase Header Archive"
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
