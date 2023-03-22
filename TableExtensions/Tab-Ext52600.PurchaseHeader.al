tableextension 52600 "DME Purchase Header" extends "Purchase Header"
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

    trigger OnInsert()
    begin
        "DME Created By" := UserId;
    end;

}
