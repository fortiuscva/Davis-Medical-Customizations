pageextension 52600 "DME Posted Sales Invoices" extends "Posted Sales Invoices"
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
