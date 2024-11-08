report 52603 "DME Purchase-Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/DMEPurchaseOrder.rdl';
    Caption = 'DME Purchase Order';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Buy-from Vendor No.", "Pay-to Vendor No.", "No. Printed";
            column(No_PurchaseHeader; "No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
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
                    column(BuyFromAddress1; BuyFromAddress[1])
                    {
                    }
                    column(BuyFromAddress2; BuyFromAddress[2])
                    {
                    }
                    column(BuyFromAddress3; BuyFromAddress[3])
                    {
                    }
                    column(BuyFromAddress4; BuyFromAddress[4])
                    {
                    }
                    column(BuyFromAddress5; BuyFromAddress[5])
                    {
                    }
                    column(BuyFromAddress6; BuyFromAddress[6])
                    {
                    }
                    column(BuyFromAddress7; BuyFromAddress[7])
                    {
                    }
                    column(ExptRecptDt_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
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
                    column(BuyfrVendNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
                    {
                    }
                    column(YourRef_PurchaseHeader; "Purchase Header"."Your Reference")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_PurchaseHeader; "Purchase Header"."No.")
                    {
                    }
                    column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
                    {
                    }
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BuyFromAddress8; BuyFromAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(CompanyInformationPhoneNo; CompanyInformation."Phone No.")
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(VendTaxIdentificationType; Format(Vend."Tax Identification Type"))
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(ReceiveByCaption; ReceiveByCaptionLbl)
                    {
                    }
                    column(VendorIDCaption; VendorIDCaptionLbl)
                    {
                    }
                    column(ConfirmToCaption; ConfirmToCaptionLbl)
                    {
                    }
                    column(BuyerCaption; BuyerCaptionLbl)
                    {
                    }
                    column(ShipCaption; ShipCaptionLbl)
                    {
                    }
                    column(ToCaption1; ToCaption1Lbl)
                    {
                    }
                    column(PurchOrderCaption; PurchOrderCaptionLbl)
                    {
                    }
                    column(PurchOrderNumCaption; PurchOrderNumCaptionLbl)
                    {
                    }
                    column(PurchOrderDateCaption; PurchOrderDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(ShipViaCaption; ShipViaCaptionLbl)
                    {
                    }
                    column(TermsCaption; TermsCaptionLbl)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
                    {
                    }
                    column(VendorOrderNo_Lbl; VendorOrderNoLbl)
                    {
                    }
                    column(VendorInvoiceNo_Lbl; VendorInvoiceNoLbl)
                    {
                    }
                    column(VendorOrderNo; "Purchase Header"."Vendor Order No.")
                    {
                    }
                    column(VendorInvoiceNo; "Purchase Header"."Vendor Invoice No.")
                    {
                    }
                    column(DMEPurch_Order_Caption; Purch_Order_CaptionLbl)
                    { }
                    column(DMEOrder_No_Caption; Order_No_CaptionLbl)
                    { }
                    column(DMEDate_Caption; Date_CaptionLbl)
                    { }
                    column(DMECurrency_Caption; Currency_CaptionLbl)
                    { }
                    column(DMECurrency_Code; "Purchase Header"."Currency Code")
                    { }
                    column(DMEShip_To_Caption; Ship_To_CaptionLbl)
                    { }
                    column(DMEFOD_Point_Caption; FOD_Point_CaptionLbl)
                    { }
                    column(DMEFOBPoint; FOBPoint)
                    { }
                    column(DMEOrder_Date_Caption; Order_Date_CaptionLbl)
                    { }
                    column(DMENo_Caption; No_CaptionLbl)
                    { }
                    column(DMEItem_Caption; Item_CaptionLbl)
                    { }
                    column(DMEUOm_Caption; UOm_CaptionLbl)
                    { }
                    column(DMEQtyCaption; QtyCaptionLbl)
                    { }
                    column(DMEUnit_Price_Caption; Unit_Price_CaptionLbl)
                    { }
                    column(DMEExtended_Price_Caption; Extended_Price_CaptionLbl)
                    { }
                    column(DMEPO_Total_Caption; PO_Total_CaptionLbl)
                    { }
                    column(DMETax_Total_Caption; Tax_Total_CaptionLbl)
                    { }
                    column(DMETotal_Caption; Total_Caption)
                    { }
                    column(DMECompInfo_Picture; CompInfo.Picture)
                    { }
                    column(DMELocationAddress1; LocationAddress[1])
                    { }
                    column(DMELocationAddress2; LocationAddress[2])
                    { }
                    column(DMELocationAddress3; LocationAddress[3])
                    { }
                    column(DMELocationAddress4; LocationAddress[4])
                    { }
                    column(DMELocationAddress5; LocationAddress[5])
                    { }
                    column(DMELocationAddress6; LocationAddress[6])
                    { }
                    column(DMELocationAddress7; LocationAddress[7])
                    { }
                    column(DMELocationAddress8; LocationAddress[8])
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
                    column(OrderConfirmationCaption; OrderConfirmationCaptionLbl)
                    { }
                    column(PhoneNoCap; PhoneNoCapLbl)
                    { }
                    column(CompanyInformation_Phone; CompanyInformation."Phone No.")
                    { }
                    column(WebSiteCaption; WebSiteCaptionLbl)
                    { }
                    column(CompanyInformation_HomePage; CompanyInformation."Home Page")
                    { }

                    dataitem("Purchase Line"; "Purchase Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purchase Header";
                        DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE("Document Type" = CONST(Order));
                        column(AmountExclInvDisc; AmountExclInvDisc)
                        {
                        }
                        column(ItemNumberToPrint; ItemNumberToPrint)
                        {
                        }
                        column(UnitofMeasure_PurchaseLine; "Unit of Measure")
                        {
                        }
                        column(Quantity_PurchaseLine; Quantity)
                        {
                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {
                            DecimalPlaces = 2 : 5;
                        }
                        column(Description_PurchaseLine; Description)
                        {
                        }
                        column(PrintFooter; PrintFooter)
                        {
                        }
                        column(InvDiscountAmt_PurchaseLine; "Inv. Discount Amount")
                        {
                        }
                        column(TaxAmount; TaxAmount)
                        {
                        }
                        column(LineAmtTaxAmtInvDiscountAmt; "Line Amount" + TaxAmount - "Inv. Discount Amount")
                        {
                        }
                        column(TotalTaxLabel; TotalTaxLabel)
                        {
                        }
                        column(BreakdownTitle; BreakdownTitle)
                        {
                        }
                        column(BreakdownLabel1; BreakdownLabel[1])
                        {
                        }
                        column(BreakdownAmt1; BreakdownAmt[1])
                        {
                        }
                        column(BreakdownLabel2; BreakdownLabel[2])
                        {
                        }
                        column(BreakdownAmt2; BreakdownAmt[2])
                        {
                        }
                        column(BreakdownLabel3; BreakdownLabel[3])
                        {
                        }
                        column(BreakdownAmt3; BreakdownAmt[3])
                        {
                        }
                        column(BreakdownAmt4; BreakdownAmt[4])
                        {
                        }
                        column(BreakdownLabel4; BreakdownLabel[4])
                        {
                        }
                        column(DocumentNo_PurchaseLine; "Document No.")
                        {
                        }
                        column(Line_No_PurchaseLine; "Line No.")
                        { }
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
                        column(InvDiscCaption; InvDiscCaptionLbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }
                        column(DMESequenceNo; SequenceNo)
                        { }
                        column(DMEPurchaseLine_Description; Description)
                        { }
                        column(DescLineVarGbl; DescLineVarGbl)
                        { }
                        column(VendorItemNoCaptionLbl; VendorItemNoCaptionLbl)
                        { }
                        column(Vendor_Item_No_; "Vendor Item No.")
                        { }
                        dataitem(ItemTrackingSpec; Integer)
                        {
                            DataItemTableView = sorting(Number);
                            DataItemLinkReference = "Purchase Line";
                            column(DMETempItemLedgEntry_ItemNo; TempTrackingSpecBuffer."Item No.")
                            { }
                            column(DMETempItemLedgEntry_LotNo; LotNo)
                            { }
                            column(DMENumber; Number)
                            { }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    TempTrackingSpecBuffer.FindSet()

                                else begin
                                    TempTrackingSpecBuffer.Next();
                                    TaxAmount := 0;
                                    AmountExclInvDisc := 0;
                                    "Purchase Line"."Line Amount" := 0;
                                    "Purchase Line"."Inv. Discount Amount" := 0;
                                end;
                                LotNo := TempTrackingSpecBuffer."Serial No.";
                            end;

                            trigger OnPreDataItem()
                            begin

                                TempTrackingSpecBuffer.SetRange("Source Ref. No.", "Purchase Line"."Line No.");
                                if TempTrackingSpecBuffer.Count = 0 then
                                    CurrReport.Break();
                                SetRange(Number, 1, TempTrackingSpecBuffer.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            DescLineVarGbl := false;
                            if ("Purchase Header"."Tax Area Code" <> '') and not UseExternalTaxEngine then
                                SalesTaxCalc.AddPurchLine("Purchase Line");

                            /*
                            if "Vendor Item No." <> '' then
                                ItemNumberToPrint := "Vendor Item No."
                            else
                                ItemNumberToPrint := "No.";
                            */
                            ItemNumberToPrint := "No.";

                            if "No." <> '' then
                                SequenceNo += 1;

                            if Type = Type::" " then begin
                                ItemNumberToPrint := '';
                                "Unit of Measure" := '';
                                "Line Amount" := 0;
                                "Inv. Discount Amount" := 0;
                                Quantity := 0;
                                DescLineVarGbl := true;
                            end;

                            AmountExclInvDisc := "Line Amount";

                            if Quantity = 0 then
                                UnitPriceToPrint := 0 // so it won't print
                            else
                                UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);

                            if OnLineNumber = NumberOfLines then begin
                                PrintFooter := true;

                                if "Purchase Header"."Tax Area Code" <> '' then begin
                                    if UseExternalTaxEngine then
                                        SalesTaxCalc.CallExternalTaxEngineForPurch("Purchase Header", true)
                                    else
                                        SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                                    SalesTaxCalc.GetSummarizedSalesTaxTable(TempSalesTaxAmtLine);
                                    BrkIdx := 0;
                                    PrevPrintOrder := 0;
                                    PrevTaxPercent := 0;
                                    TaxAmount := 0;
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
                                                        BreakdownLabel[BrkIdx] := CopyStr(StrSubstNo("Print Description", "Tax %"), 1, MaxStrLen(BreakdownLabel[BrkIdx]));
                                                end;
                                                BreakdownAmt[BrkIdx] := BreakdownAmt[BrkIdx] + "Tax Amount";
                                                TaxAmount := TaxAmount + "Tax Amount";
                                            until Next() = 0;
                                    end;
                                    if BrkIdx = 1 then begin
                                        Clear(BreakdownLabel);
                                        Clear(BreakdownAmt);
                                    end;
                                end;
                            end;
                            GetSerialLotNo("Purchase Line");
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(AmountExclInvDisc);
                            NumberOfLines := Count;
                            OnLineNumber := 0;
                            PrintFooter := false;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then
                            PurchasePrinted.Run("Purchase Header");
                        CurrReport.Break();
                    end;
                    CopyNo := CopyNo + 1;
                    SequenceNo := 0;
                    if CopyNo = 1 then // Original
                        Clear(CopyTxt)
                    else
                        CopyTxt := Text000;
                    TaxAmount := 0;

                    Clear(BreakdownTitle);
                    Clear(BreakdownLabel);
                    Clear(BreakdownAmt);
                    TotalTaxLabel := Text008;
                    if "Purchase Header"."Tax Area Code" <> '' then begin
                        TaxArea.Get("Purchase Header"."Tax Area Code");
                        case TaxArea."Country/Region" of
                            TaxArea."Country/Region"::US:
                                TotalTaxLabel := Text005;
                            TaxArea."Country/Region"::CA:
                                TotalTaxLabel := Text007;
                        end;
                        UseExternalTaxEngine := TaxArea."Use External Tax Engine";
                        SalesTaxCalc.StartSalesTaxCalculation();
                    end;
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
                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                if "Purchaser Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Purchaser Code");

                if "Payment Terms Code" = '' then
                    Clear(PaymentTerms)
                else
                    PaymentTerms.Get("Payment Terms Code");

                if "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                FormatAddress.PurchHeaderBuyFrom(BuyFromAddress, "Purchase Header");
                FormatAddress.PurchHeaderShipTo(ShipToAddress, "Purchase Header");

                if not CurrReport.Preview then begin
                    if ArchiveDocument then
                        ArchiveManagement.StorePurchDocument("Purchase Header", LogInteraction);

                    if LogInteraction then begin
                        CalcFields("No. of Archived Versions");
                        SegManagement.LogDocument(
                          13, "No.", "Doc. No. Occurrence", "No. of Archived Versions", DATABASE::Vendor, "Buy-from Vendor No.",
                          "Purchaser Code", '', "Posting Description", '');
                    end;
                end;

                if "Posting Date" <> 0D then
                    UseDate := "Posting Date"
                else
                    UseDate := WorkDate();

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

                Clear(LocationAddress);
                if LocationRec.Get("Purchase Header"."Location Code") then
                    FormatAddressExt.FormatAddr(LocationAddress, LocationRec.Name, LocationRec."Name 2", LocationRec.Contact, LocationRec.Address, LocationRec."Address 2",
                                                LocationRec.City, LocationRec."Post Code", LocationRec.County, LocationRec."Country/Region Code");
            end;

            trigger OnPreDataItem()
            begin
                if PrintCompany then
                    FormatAddress.Company(CompanyAddress, CompanyInformation)
                else
                    Clear(CompanyAddress);

                CompInfo.Get();
                CompInfo.CalcFields(Picture);
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
                    field(NumberOfCopies; NoCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Number of Copies';
                        ToolTip = 'Specifies the number of copies of each blanket purchase order, in addition to the original, that you want to print.';
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Company Address';
                        ToolTip = 'Specifies if you are printing on plain paper or if your company address is not pre-printed on your forms. If you do not select this field, the report will omit your company''s address.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        Enabled = ArchiveDocumentEnable;
                        ToolTip = 'Specifies if the document is archived when you run the report.';

                        trigger OnValidate()
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if the interaction with the vendor is logged when ,you run the report.';

                        trigger OnValidate()
                        begin
                            if LogInteraction then
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
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
            ArchiveDocumentEnable := true;
        end;

        trigger OnOpenPage()
        begin
            ArchiveDocument := ArchiveManagement.PurchaseDocArchiveGranule();
            LogInteraction := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Purch. Ord.") <> '';

            ArchiveDocumentEnable := ArchiveDocument;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get('');
    end;

    var
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        RespCenter: Record "Responsibility Center";
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        Vend: Record Vendor;
        Language: Codeunit Language;
        CompanyAddress: array[8] of Text[100];
        BuyFromAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text[10];
        ItemNumberToPrint: Text[50];
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        PurchasePrinted: Codeunit "Purch.Header-Printed";
        FormatAddress: Codeunit "Format Address";
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        ArchiveManagement: Codeunit ArchiveManagement;
        SegManagement: Codeunit SegManagement;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        TaxAmount: Decimal;
        TotalTaxLabel: Text[30];
        BreakdownTitle: Text[30];
        BreakdownLabel: array[4] of Text[30];
        BreakdownAmt: array[4] of Decimal;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        PrevTaxPercent: Decimal;
        UseDate: Date;
        Text000: Label 'COPY';
        Text003: Label 'Sales Tax Breakdown:';
        Text004: Label 'Other Taxes';
        Text005: Label 'Total Sales Tax:';
        Text006: Label 'Tax Breakdown:';
        Text007: Label 'Total Tax:';
        Text008: Label 'Tax:';
        UseExternalTaxEngine: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        ToCaptionLbl: Label 'To:';
        ReceiveByCaptionLbl: Label 'Receive By';
        VendorIDCaptionLbl: Label 'Vendor ID';
        ConfirmToCaptionLbl: Label 'Confirm To';
        BuyerCaptionLbl: Label 'Buyer';
        ShipCaptionLbl: Label 'Ship';
        ToCaption1Lbl: Label 'To:';
        PurchOrderCaptionLbl: Label 'PURCHASE ORDER';
        PurchOrderNumCaptionLbl: Label 'Purchase Order Number:';
        PurchOrderDateCaptionLbl: Label 'Purchase Order Date:';
        PageCaptionLbl: Label 'Page:';
        ShipViaCaptionLbl: Label 'Ship Via';
        TermsCaptionLbl: Label 'Terms';
        PhoneNoCaptionLbl: Label 'Phone No.';
        TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitPriceCaptionLbl: Label 'Unit Price';
        TotalPriceCaptionLbl: Label 'Total Price';
        SubtotalCaptionLbl: Label 'Subtotal:';
        InvDiscCaptionLbl: Label 'Invoice Discount:';
        TotalCaptionLbl: Label 'Total:';
        VendorOrderNoLbl: Label 'Vendor Order No.';
        VendorInvoiceNoLbl: Label 'Vendor Invoice No.';
        Order_No_CaptionLbl: Label 'Order No.:';
        Purch_Order_CaptionLbl: Label 'Purchase Order';
        Date_CaptionLbl: Label 'Date:';
        Currency_CaptionLbl: Label 'Currency:';
        Ship_To_CaptionLbl: Label 'SHIP TO:';
        FOD_Point_CaptionLbl: Label 'FOB POINT';
        Order_Date_CaptionLbl: Label 'ORDER DATE';
        No_CaptionLbl: Label 'NO.';
        Item_CaptionLbl: Label 'ITEM';
        UOm_CaptionLbl: Label 'UOM';
        QtyCaptionLbl: Label 'QTY.';
        Unit_Price_CaptionLbl: Label 'UNIT PRICE';
        Extended_Price_CaptionLbl: Label 'EXTENDED PRICE';
        PO_Total_CaptionLbl: Label 'PO Total:';
        Tax_Total_CaptionLbl: Label 'Tax Total:';
        Total_Caption: Text;
        SequenceNo: Integer;
        FOBPoint: Code[10];
        CompInfo: Record "Company Information";
        FormatAddressExt: Codeunit "Format Address";
        LocationAddress: array[8] of Text[100];
        LocationRec: Record Location;
        CompInfoExt: Record "Company Information";
        CompanyAddressExt: array[8] of Text[100];
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        LotNo: Text;
        DescLineVarGbl: Boolean;
        OrderConfirmationCaptionLbl: Label 'ORDER CONFIRMATION#';
        VendorItemNoCaptionLbl: Label 'Vendor Item No.: ';
        WebSiteCaptionLbl: Label 'Website: ';
        PhoneNoCapLbl: Label 'Phone No: ';




    local procedure GetSerialLotNo(PurchaseLine: Record "Purchase Line")
    var
        ItemTrackDocMgmt: Codeunit "Item Tracking Doc. Management";
    begin
        Clear(TempTrackingSpecBuffer);
        TempTrackingSpecBuffer.DeleteAll();

        ItemTrackDocMgmt.RetrieveDocumentItemTracking(TempTrackingSpecBuffer, PurchaseLine."Document No.", DATABASE::"Purchase Header", PurchaseLine."Document Type".AsInteger());
    end;
}

