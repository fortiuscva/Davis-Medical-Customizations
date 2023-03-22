pageextension 52605 "DME Item List" extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field("DME Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how many units of the item are inbound on purchase orders, meaning listed on outstanding purchase order lines.';
            }
            field("DME Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how many units of the item are allocated to sales orders, meaning listed on outstanding sales orders lines.';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Qty. on Purch. Order", "Qty. on Sales Order");
    end;
}
