pageextension 52602 "DME Purchase Order" extends "Purchase Order"
{

    layout
    {
        addlast(General)
        {
            field("DME Created By"; Rec."DME Created By")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Created By field.';
            }
        }
    }
}
