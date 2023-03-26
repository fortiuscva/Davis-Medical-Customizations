codeunit 52600 "DME Misc. Events & Subscribers"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnValidateSellToCustomerNoOnBeforeRecallModifyAddressNotification', '', false, false)]
    local procedure Tab36__OnValidateSellToCustomerNoOnBeforeRecallModifyAddressNotification(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header");
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            If (SalesHeader."Sell-to Customer No." <> xSalesHeader."Sell-to Customer No.") and (xSalesHeader."Sell-to Customer No." = '') then begin
                SalesHeader.Validate("Location Code", 'VISTA');
                if SalesHeader.Modify() then;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Profile Offsetting", 'OnMaintainPlanningLineOnBeforeReqLineInsert', '', false, false)]
    local procedure Cod99000854_OnMaintainPlanningLineOnBeforeReqLineInsert(var RequisitionLine: Record "Requisition Line"; var SupplyInvtProfile: Record "Inventory Profile"; PlanToDate: Date; CurrentForecast: Code[10]; NewPhase: Option; Direction: Option; DemandInvtProfile: Record "Inventory Profile"; ExcludeForecastBefore: Date);
    begin
        RequisitionLine."Accept Action Message" := false;
    end;

}
