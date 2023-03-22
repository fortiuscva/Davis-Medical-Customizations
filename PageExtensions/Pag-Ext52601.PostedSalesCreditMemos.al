pageextension 52601 "DME Posted Sales Credit Memos" extends "Posted Sales Credit Memos"
{
    layout
    {
        addafter("Ship-to Post Code")
        {
            field("DME Ship-to County"; Rec."Ship-to County")
            {
                Caption = 'Ship-to State';
                ApplicationArea = All;
                ToolTip = 'Specifies the state, province or county as a part of the address.';
            }
        }
    }
}
