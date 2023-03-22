pageextension 52603 "DME Purchase Order Subform" extends "Purchase Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("DME Vendor Item No."; Rec."Vendor Item No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vendor Item No. field.';
            }
        }
    }
}
