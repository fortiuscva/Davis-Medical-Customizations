report 52604 "DME Sales Credit Memo NA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/DMESalesCreditMemoNA.rdl';
    Caption = 'DME Sales Credit Memo';

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeading = 'Sales Credit Memo';
            column(No_SalesCrMemoHeader; "No.")
            {
            }
            column(DMEReferenceNo_Caption; ReferenceNo_CaptionLbl)
            { }
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                dataitem(SalesLineComments; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No."), "Document Line No." = FIELD("Line No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST("Posted Credit Memo"), "Print On Credit Memo" = CONST(true));

                    trigger OnAfterGetRecord()
                    begin
                        InsertTempLine(Comment, 10);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempSalesCrMemoLine := "Sales Cr.Memo Line";
                    TempSalesCrMemoLine.Insert();
                    HighestLineNo := "Line No.";
                end;

                trigger OnPreDataItem()
                begin
                    TempSalesCrMemoLine.Reset();
                    TempSalesCrMemoLine.DeleteAll();
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST("Posted Credit Memo"), "Print On Credit Memo" = CONST(true), "Document Line No." = CONST(0));

                trigger OnAfterGetRecord()
                begin
                    InsertTempLine(Comment, 1000);
                end;

                trigger OnPreDataItem()
                begin
                    with TempSalesCrMemoLine do begin
                        Init();
                        "Document No." := "Sales Cr.Memo Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;
                    TempSalesCrMemoLine.Insert();
                end;
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyAddress1; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress2; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress3; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress4; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress5; CompanyAddress[5])
                    {
                    }
                    column(CompanyAddress6; CompanyAddress[6])
                    {
                    }
                    column(CopyTxt; CopyTxt)
                    {
                    }
                    column(BillToAddress1; BillToAddress[1])
                    {
                    }
                    column(BillToAddress2; BillToAddress[2])
                    {
                    }
                    column(BillToAddress3; BillToAddress[3])
                    {
                    }
                    column(BillToAddress4; BillToAddress[4])
                    {
                    }
                    column(BillToAddress5; BillToAddress[5])
                    {
                    }
                    column(BillToAddress6; BillToAddress[6])
                    {
                    }
                    column(BillToAddress7; BillToAddress[7])
                    {
                    }
                    column(ShptDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shipment Date")
                    {
                    }
                    column(ApplDocType_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. Type")
                    {
                    }
                    column(ApplDocNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Applies-to Doc. No.")
                    {
                    }
                    column(ShipToAddress1; ShipToAddress[1])
                    {
                    }
                    column(ShipToAddress2; ShipToAddress[2])
                    {
                    }
                    column(ShipToAddress3; ShipToAddress[3])
                    {
                    }
                    column(ShipToAddress4; ShipToAddress[4])
                    {
                    }
                    column(ShipToAddress5; ShipToAddress[5])
                    {
                    }
                    column(ShipToAddress6; ShipToAddress[6])
                    {
                    }
                    column(ShipToAddress7; ShipToAddress[7])
                    {
                    }
                    column(BilltoCustNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."Bill-to Customer No.")
                    {
                    }
                    column(ExtDocNo_SalesCrMemoHeader; "Sales Cr.Memo Header"."External Document No.")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(DocDate_SalesCrMemoHeader; "Sales Cr.Memo Header"."Document Date")
                    {
                    }
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BillToAddress8; BillToAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(TaxRegLabel; TaxRegLabel)
                    {
                    }
                    column(TaxRegNo; TaxRegNo)
                    {
                    }
                    column(PrintFooter; PrintFooter)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(TaxIdentType_Cust; Format(Cust."Tax Identification Type"))
                    {
                    }
                    column(CreditCaption; CreditCaptionLbl)
                    {
                    }
                    column(ShipDateCaption; ShipDateCaptionLbl)
                    {
                    }
                    column(ApplytoTypeCaption; ApplytoTypeCaptionLbl)
                    {
                    }
                    column(ApplytoNumberCaption; ApplytoNumberCaptionLbl)
                    {
                    }
                    column(CustomerIDCaption; CustomerIDCaptionLbl)
                    {
                    }
                    column(PONumberCaption; PONumberCaptionLbl)
                    {
                    }
                    column(SalesPersonCaption; SalesPersonCaptionLbl)
                    {
                    }
                    column(ShipCaption; ShipCaptionLbl)
                    {
                    }
                    column(CreditMemoCaption; CreditMemoCaptionLbl)
                    {
                    }
                    column(CreditMemoNumberCaption; CreditMemoNumberCaptionLbl)
                    {
                    }
                    column(CreditMemoDateCaption; CreditMemoDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(DMECRMemo_Caption; CRMemo_CaptionLbl)
                    { }
                    column(DMEDate_Caption; Date_CaptionLbl)
                    { }
                    column(DMEDueDate_Caption; DueDate_CaptionLbl)
                    { }
                    column(DMEDue_Date; "Sales Cr.Memo Header"."Due Date")
                    { }
                    column(DMECurrency_Caption; Currency_CaptionLbl)
                    { }
                    column(DMECurrency_Code; "Sales Cr.Memo Header"."Currency Code")
                    { }
                    column(DMEBill_To_Caption; Bill_To_CaptionLbl)
                    { }
                    column(DMEShip_To_Caption; Ship_To_CaptionLbl)
                    { }
                    column(DMECustomer_Ref_Caption; Customer_Ref_CaptionLbl)
                    { }
                    column(DMECustReference; CustReference)
                    { }
                    column(DMETerms_Caption; Terms_CaptionLbl)
                    { }
                    column(DMEPayment_Terms_Code; "Sales Cr.Memo Header"."Payment Terms Code")
                    { }
                    column(DMEContact_Caption; Contact_CaptionLbl)
                    { }
                    column(DMESell_to_Contact; "Sales Cr.Memo Header"."Sell-to Contact")
                    { }
                    column(DMESOTypeCaption; SOTypeCaptionLbl)
                    { }
                    column(DMESoType; SoType)
                    { }
                    column(DMESONumbCaption; SONumbCaptionLbl)
                    { }
                    column(DMEReturn_Order_No_; "Sales Cr.Memo Header"."Return Order No.")
                    { }
                    column(DMECustPoNoCaption; CustPoNoCaptionLbl)
                    { }
                    column(DMECustPONo; CustPONo)
                    { }
                    column(DMEShipment_Numb_Caption; Shipment_Numb_CaptionLbl)
                    { }
                    column(DMEshipmentNo; ShipmentNo)
                    { }
                    column(DMENo_Caption; No_CaptionLbl)
                    { }
                    column(DMEItem_Caption; Item_CaptionLbl)
                    { }
                    column(DMEUOm_Caption; UOm_CaptionLbl)
                    { }
                    column(DMEDisc_Caption; Disc_CaptionLbl)
                    { }
                    column(DMEQtyCaption; QtyCaptionLbl)
                    { }
                    column(DMEUnit_Price_Caption; Unit_Price_CaptionLbl)
                    { }
                    column(DMEExtended_Price_Caption; Extended_Price_CaptionLbl)
                    { }
                    column(DMESO_Total_Caption; SO_Total_CaptionLbl)
                    { }
                    column(DMETax_Total_Caption; Tax_Total_CaptionLbl)
                    { }
                    column(DMETotal_Caption; Total_Caption)
                    { }
                    column(DMECompanyAddress1; CompanyAddressExt[1])
                    { }
                    column(DMECompanyAddress2; CompanyAddressExt[2])
                    { }
                    column(DMECompanyAddress3; CompanyAddressExt[3])
                    { }
                    column(DMECompanyAddress4; CompanyAddressExt[4])
                    { }
                    column(DMECompanyAddress5; CompanyAddressExt[5])
                    { }
                    column(DMECompanyAddress6; CompanyAddressExt[6])
                    { }
                    column(DMECompanyAddress7; CompanyAddressExt[7])
                    { }
                    column(DMECompanyAddress8; CompanyAddressExt[8])
                    { }
                    column(PhoneNoCap; PhoneNoCapLbl)
                    { }
                    column(CompanyInformation_Phone; CompanyInfo."Phone No.")
                    { }
                    column(WebSiteCaption; WebSiteCaptionLbl)
                    { }
                    column(CompanyInformation_HomePage; CompanyInfo."Home Page")
                    { }

                    dataitem(SalesCrMemoLine; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesCrMemoLineNumber; Number)
                        { }
                        column(AmountExclInvDisc; AmountExclInvDisc)
                        {
                        }
                        column(TempSalesCrMemoLineNo; TempSalesCrMemoLine."No.")
                        {
                        }
                        column(TempSalesCrMemoLineUOM; TempSalesCrMemoLine."Unit of Measure")
                        {
                        }
                        column(TempSalesCrMemoLineQty; TempSalesCrMemoLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {
                            DecimalPlaces = 2 : 5;
                        }
                        column(TempSalesCrMemoLineDesc; TempSalesCrMemoLine.Description + ' ' + TempSalesCrMemoLine."Description 2")
                        {
                        }
                        column(TaxLiable; TaxLiable)
                        {
                        }
                        column(TempSalesCrMemoLineAmtTaxLiable; TempSalesCrMemoLine.Amount - TaxLiable)
                        {
                        }
                        column(TempSalesCrMemoLineAmtAmtExclInvDisc; TempSalesCrMemoLine.Amount - AmountExclInvDisc)
                        {
                        }
                        column(TempSalesCrMemoLineAmtInclVATAmt; TempSalesCrMemoLine."Amount Including VAT" - TempSalesCrMemoLine.Amount)
                        {
                        }
                        column(TempSalesCrMemoLineAmtInclVAT; TempSalesCrMemoLine."Amount Including VAT")
                        {
                        }
                        column(BreakdownTitle; BreakdownTitle)
                        {
                        }
                        column(BreakdownLabel1; BreakdownLabel[1])
                        {
                        }
                        column(BreakdownLabel2; BreakdownLabel[2])
                        {
                        }
                        column(BreakdownAmt1; BreakdownAmt[1])
                        {
                        }
                        column(BreakdownAmt2; BreakdownAmt[2])
                        {
                        }
                        column(BreakdownAmt3; BreakdownAmt[3])
                        {
                        }
                        column(BreakdownLabel3; BreakdownLabel[3])
                        {
                        }
                        column(BreakdownAmt4; BreakdownAmt[4])
                        {
                        }
                        column(BreakdownLabel4; BreakdownLabel[4])
                        {
                        }
                        column(TotalTaxLabel; TotalTaxLabel)
                        {
                        }
                        column(ItemNoCaption; ItemNoCaptionLbl)
                        {
                        }
                        column(UnitCaption; UnitCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(QuantityCaption; QuantityCaptionLbl)
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(TotalPriceCaption; TotalPriceCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(InvoiceDiscountCaption; InvoiceDiscountCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(AmountSubjecttoSalesTaxCaption; AmountSubjecttoSalesTaxCaptionLbl)
                        {
                        }
                        column(AmountExemptfromSalesTaxCaption; AmountExemptfromSalesTaxCaptionLbl)
                        {
                        }
                        column(DMETempSalesCrMemoLineExt_DiscPerc; TempSalesCrMemoLineExt."Line Discount %")
                        { }
                        column(DMESequenceNo; SequenceNo)
                        { }
                        column(DMETempSalesCrMemoLine_Description; TempSalesCrMemoLine.Description)
                        { }
                        column(DescLineVarGbl; DescLineVarGbl)
                        { }
                        dataitem(ItemTrackingSpec; Integer)
                        {
                            DataItemTableView = sorting(Number);
                            DataItemLinkReference = SalesCrMemoLine;
                            column(DMETempItemLedgEntry_ItemNo; TempTrackingSpecBuffer."Item No.")
                            { }
                            column(DMETempItemLedgEntry_LotNo; LotNo)
                            { }
                            column(DMENumber; Number)
                            { }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    TempTrackingSpecBuffer.FindSet();
                                    LotNo := TempTrackingSpecBuffer."Serial No.";
                                end else begin
                                    TempTrackingSpecBuffer.Next();
                                    LotNo := TempTrackingSpecBuffer."Serial No.";
                                end;
                            end;

                            trigger OnPreDataItem()
                            begin
                                TempTrackingSpecBuffer.SetRange("Source Ref. No.", TempSalesCrMemoLine."Line No.");
                                if TempTrackingSpecBuffer.Count = 0 then
                                    CurrReport.Break();
                                SetRange(Number, 1, TempTrackingSpecBuffer.Count);
                            end;
                        }
                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            DescLineVarGbl := false;
                            with TempSalesCrMemoLine do begin
                                if OnLineNumber = 1 then
                                    Find('-')
                                else
                                    Next();

                                if "No." <> '' then
                                    SequenceNo += 1;

                                if Type = Type::" " then begin
                                    "No." := '';
                                    "Unit of Measure" := '';
                                    Amount := 0;
                                    "Amount Including VAT" := 0;
                                    "Inv. Discount Amount" := 0;
                                    Quantity := 0;
                                    DescLineVarGbl := true;
                                end else
                                    if Type = Type::"G/L Account" then
                                        "No." := '';

                                if Amount <> "Amount Including VAT" then
                                    TaxLiable := Amount
                                else
                                    TaxLiable := 0;

                                AmountExclInvDisc := Amount + "Inv. Discount Amount";
                                if Quantity = 0 then
                                    UnitPriceToPrint := 0 // so it won't print
                                else
                                    UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);
                            end;
                            GetSerialLotNo(TempSalesCrMemoLine);
                            if OnLineNumber = NumberOfLines then
                                PrintFooter := true;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(TaxLiable);
                            Clear(AmountExclInvDisc);
                            NumberOfLines := TempSalesCrMemoLine.Count();
                            SetRange(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                            PrintFooter := false;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then
                            SalesCrMemoPrinted.Run("Sales Cr.Memo Header");
                        CurrReport.Break();
                    end;
                    CopyNo := CopyNo + 1;
                    if CopyNo = 1 then // Original
                        Clear(CopyTxt)
                    else
                        CopyTxt := Text000;

                    SequenceNo := 0;
                end;

                trigger OnPreDataItem()
                begin
                    NoLoops := 1 + Abs(NoCopies);
                    if NoLoops <= 0 then
                        NoLoops := 1;
                    CopyNo := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInfo."Phone No." := RespCenter."Phone No.";
                        CompanyInfo."Fax No." := RespCenter."Fax No.";
                    end;

                if "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Salesperson Code");

                if "Bill-to Customer No." = '' then begin
                    "Bill-to Name" := Text009;
                    "Ship-to Name" := Text009;
                end;

                FormatAddress.SalesCrMemoBillTo(BillToAddress, "Sales Cr.Memo Header");
                FormatAddress.SalesCrMemoShipTo(ShipToAddress, ShipToAddress, "Sales Cr.Memo Header");

                if LogInteraction then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          6, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.", "Salesperson Code",
                          "Campaign No.", "Posting Description", '');

                CompInfoExt.Get();
                FormatAddressExt.FormatAddr(CompanyAddressExt, '', '', '', CompInfoExt.Address,
                            CompInfoExt."Address 2", CompInfoExt.City, CompInfoExt."Post Code",
                            CompInfoExt.County, '');
                CompanyAddressExt[7] := PhoneNoCapLbl + CompInfoExt."Phone No.";
                CompanyAddressExt[8] := WebSiteCaptionLbl + CompInfoExt."Home Page";
                CompressArray(CompanyAddressExt);

                if "Currency Code" <> '' then
                    Total_Caption := StrSubstNo('Total (%1):', "Currency Code")
                else
                    Total_Caption := 'Total (USD):';

                Clear(BreakdownTitle);
                Clear(BreakdownLabel);
                Clear(BreakdownAmt);
                TotalTaxLabel := Text008;
                TaxRegNo := '';
                TaxRegLabel := '';
                if "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            TotalTaxLabel := Text005;
                        TaxArea."Country/Region"::CA:
                            begin
                                TotalTaxLabel := Text007;
                                TaxRegNo := CompanyInfo."VAT Registration No.";
                                TaxRegLabel := CompanyInfo.FieldCaption("VAT Registration No.");
                            end;
                    end;
                    SalesTaxCalc.StartSalesTaxCalculation();
                    if TaxArea."Use External Tax Engine" then
                        SalesTaxCalc.CallExternalTaxEngineForDoc(DATABASE::"Sales Cr.Memo Header", 0, "No.")
                    else begin
                        SalesTaxCalc.AddSalesCrMemoLines("No.");
                        SalesTaxCalc.EndSalesTaxCalculation("Posting Date");
                    end;
                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                    BrkIdx := 0;
                    PrevPrintOrder := 0;
                    PrevTaxPercent := 0;
                    with TempSalesTaxAmtLine do begin
                        Reset();
                        SetCurrentKey("Print Order", "Tax Area Code for Key", "Tax Jurisdiction Code");
                        if Find('-') then
                            repeat
                                if ("Print Order" = 0) or
                                   ("Print Order" <> PrevPrintOrder) or
                                   ("Tax %" <> PrevTaxPercent)
                                then begin
                                    BrkIdx := BrkIdx + 1;
                                    if BrkIdx > 1 then begin
                                        if TaxArea."Country/Region" = TaxArea."Country/Region"::CA then
                                            BreakdownTitle := Text006
                                        else
                                            BreakdownTitle := Text003;
                                    end;
                                    if BrkIdx > ArrayLen(BreakdownAmt) then begin
                                        BrkIdx := BrkIdx - 1;
                                        BreakdownLabel[BrkIdx] := Text004;
                                    end else
                                        BreakdownLabel[BrkIdx] := StrSubstNo("Print Description", "Tax %");
                                end;
                                BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
                            until Next() = 0;
                    end;
                    if BrkIdx = 1 then begin
                        Clear(BreakdownLabel);
                        Clear(BreakdownAmt);
                    end;
                end;
                CustPONo := "External Document No.";

            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoCopies; NoCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number of Copies';
                        ToolTip = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        ToolTip = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Sales Cr. Memo") <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        SalesSetup.Get();
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        if PrintCompany then
            FormatAddress.Company(CompanyAddress, CompanyInfo)
        else
            Clear(CompanyAddress);
    end;

    var
        TaxLiable: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        TempSalesCrMemoLine: Record "Sales Cr.Memo Line" temporary;
        RespCenter: Record "Responsibility Center";
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        Cust: Record Customer;
        Language: Codeunit Language;
        SalesCrMemoPrinted: Codeunit "Sales Cr. Memo-Printed";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        SegManagement: Codeunit SegManagement;
        CompanyAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        SpacePointer: Integer;
        LogInteraction: Boolean;
        Text000: Label 'COPY';
        TaxRegNo: Text;
        TaxRegLabel: Text;
        TotalTaxLabel: Text;
        BreakdownTitle: Text;
        BreakdownLabel: array[4] of Text;
        BreakdownAmt: array[4] of Decimal;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        PrevTaxPercent: Decimal;
        Text003: Label 'Sales Tax Breakdown:';
        Text004: Label 'Other Taxes';
        Text005: Label 'Total Sales Tax:';
        Text006: Label 'Tax Breakdown:';
        Text007: Label 'Total Tax:';
        Text008: Label 'Tax:';
        Text009: Label 'VOID CREDIT MEMO';
        [InDataSet]
        LogInteractionEnable: Boolean;
        CreditCaptionLbl: Label 'Credit';
        ShipDateCaptionLbl: Label 'Ship Date';
        ApplytoTypeCaptionLbl: Label 'Apply to Type';
        ApplytoNumberCaptionLbl: Label 'Apply to Number';
        CustomerIDCaptionLbl: Label 'Customer ID';
        PONumberCaptionLbl: Label 'P.O. Number';
        SalesPersonCaptionLbl: Label 'SalesPerson';
        ShipCaptionLbl: Label 'Ship';
        CreditMemoCaptionLbl: Label 'CREDIT MEMO';
        CreditMemoNumberCaptionLbl: Label 'Credit Memo Number:';
        CreditMemoDateCaptionLbl: Label 'Credit Memo Date:';
        PageCaptionLbl: Label 'Page:';
        TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
        ToCaptionLbl: Label 'To:';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitPriceCaptionLbl: Label 'Unit Price';
        TotalPriceCaptionLbl: Label 'Total Price';
        SubtotalCaptionLbl: Label 'Subtotal:';
        InvoiceDiscountCaptionLbl: Label 'Invoice Discount:';
        TotalCaptionLbl: Label 'Total:';
        AmountSubjecttoSalesTaxCaptionLbl: Label 'Amount Subject to Sales Tax';
        AmountExemptfromSalesTaxCaptionLbl: Label 'Amount Exempt from Sales Tax';

        CRMemo_CaptionLbl: Label 'CRMEMO';
        ReferenceNo_CaptionLbl: Label 'Reference Number:';
        Date_CaptionLbl: Label 'Date:';
        DueDate_CaptionLbl: Label 'Due Date:';
        Currency_CaptionLbl: Label 'Currency:';
        Bill_To_CaptionLbl: Label 'BILL TO:';
        Ship_To_CaptionLbl: Label 'SHIP TO:';
        Customer_Ref_CaptionLbl: Label 'CUSTOMER REF. NUMBER';
        Terms_CaptionLbl: Label 'TERMS';
        Contact_CaptionLbl: Label 'CONTACT';
        SOTypeCaptionLbl: Label 'SO TYPE';
        SONumbCaptionLbl: Label 'SO NUMBER';
        CustPoNoCaptionLbl: Label 'CUSTOMER P.O. No.';
        Shipment_Numb_CaptionLbl: Label 'SHIPMENT NUMBER';
        No_CaptionLbl: Label 'NO.';
        Item_CaptionLbl: Label 'ITEM';
        UOm_CaptionLbl: Label 'UOM';
        Disc_CaptionLbl: Label 'DISC.';
        QtyCaptionLbl: Label 'QTY.';
        Unit_Price_CaptionLbl: Label 'UNIT PRICE';
        Extended_Price_CaptionLbl: Label 'EXTENDED PRICE';
        SO_Total_CaptionLbl: Label 'SO Total:';
        Tax_Total_CaptionLbl: Label 'Tax Total:';
        Total_Caption: Text;
        CustPONo: Code[35];
        SoType: Code[10];
        CustReference: Code[20];
        ShipmentNo: Code[20];
        TempSalesCrMemoLineExt: Record "Sales Cr.Memo Line" temporary;
        HighestLineNoExt: Integer;
        SpacePointerExt: Integer;
        SequenceNo: Integer;
        OnLineNumberExt: Integer;
        NumberOfLinesExt: Integer;
        FormatAddressExt: Codeunit "Format Address";
        CompInfoExt: Record "Company Information";
        CompanyAddressExt: array[8] of Text[100];
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        LotNo: Text;
        DescLineVarGbl: Boolean;
        WebSiteCaptionLbl: Label 'Website: ';
        PhoneNoCapLbl: Label 'Phone No: ';


    local procedure InsertTempLine(Comment: Text[80]; IncrNo: Integer)
    begin
        with TempSalesCrMemoLine do begin
            Init();
            "Document No." := "Sales Cr.Memo Header"."No.";
            "Line No." := HighestLineNo + IncrNo;
            HighestLineNo := "Line No.";
        end;
        if StrLen(Comment) <= MaxStrLen(TempSalesCrMemoLine.Description) then begin
            TempSalesCrMemoLine.Description := CopyStr(Comment, 1, MaxStrLen(TempSalesCrMemoLine.Description));
            TempSalesCrMemoLine."Description 2" := '';
        end else begin
            SpacePointer := MaxStrLen(TempSalesCrMemoLine.Description) + 1;
            while (SpacePointer > 1) and (Comment[SpacePointer] <> ' ') do
                SpacePointer := SpacePointer - 1;
            if SpacePointer = 1 then
                SpacePointer := MaxStrLen(TempSalesCrMemoLine.Description) + 1;
            TempSalesCrMemoLine.Description := CopyStr(Comment, 1, SpacePointer - 1);
            TempSalesCrMemoLine."Description 2" :=
              CopyStr(CopyStr(Comment, SpacePointer + 1), 1, MaxStrLen(TempSalesCrMemoLine."Description 2"));
        end;
        TempSalesCrMemoLine.Insert();
    end;

    local procedure GetSerialLotNo(TempSalesCrMemoLine: Record "Sales Cr.Memo Line" temporary)
    var
        ItemTrackDocMgmt: Codeunit "Item Tracking Doc. Management";
    begin
        Clear(TempTrackingSpecBuffer);
        TempTrackingSpecBuffer.DeleteAll();

        ItemTrackDocMgmt.RetrieveDocumentItemTracking(TempTrackingSpecBuffer, TempSalesCrMemoLine."Document No.", DATABASE::"Sales Cr.Memo Header", 0);
    end;
}

