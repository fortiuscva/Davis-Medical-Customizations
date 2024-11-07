report 52602 "DME Sales-Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/DMESalesOrder.rdl';
    Caption = 'DME Sales Order';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeading = 'Sales Order';
            column(No_SalesHeader; "No.")
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE("Document Type" = CONST(Order));
                dataitem(SalesLineComments; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No."), "Document Line No." = FIELD("Line No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST(Order), "Print On Order Confirmation" = CONST(true));

                    trigger OnAfterGetRecord()
                    begin
                        InsertTempLine(Comment, 10)
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempSalesLine := "Sales Line";
                    TempSalesLine.Insert();

                    TempSalesLineAsm := "Sales Line";
                    TempSalesLineAsm.Insert();

                    HighestLineNo := "Line No.";
                    if ("Sales Header"."Tax Area Code" <> '') and not UseExternalTaxEngine then
                        SalesTaxCalc.AddSalesLine(TempSalesLine);
                end;

                trigger OnPostDataItem()
                begin
                    if "Sales Header"."Tax Area Code" <> '' then begin
                        if UseExternalTaxEngine then
                            SalesTaxCalc.CallExternalTaxEngineForSales("Sales Header", true)
                        else
                            SalesTaxCalc.EndSalesTaxCalculation(UseDate);
                        SalesTaxCalc.DistTaxOverSalesLines(TempSalesLine);
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
                end;

                trigger OnPreDataItem()
                begin
                    TempSalesLine.Reset();
                    TempSalesLine.DeleteAll();
                    TempSalesLineAsm.Reset();
                    TempSalesLineAsm.DeleteAll();
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST(Order), "Print On Order Confirmation" = CONST(true), "Document Line No." = CONST(0));

                trigger OnAfterGetRecord()
                begin
                    InsertTempLine(Comment, 1000);
                end;

                trigger OnPreDataItem()
                begin
                    with TempSalesLine do begin
                        Init();
                        "Document Type" := "Sales Header"."Document Type";
                        "Document No." := "Sales Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;
                    TempSalesLine.Insert();
                end;
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo3.Picture)
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
                    column(ShptDate_SalesHeader; "Sales Header"."Shipment Date")
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
                    column(BilltoCustNo_SalesHeader; "Sales Header"."Bill-to Customer No.")
                    {
                    }
                    column(ExtDocNo_SalesHeader; "Sales Header"."External Document No.")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(OrderDate_SalesHeader; "Sales Header"."Order Date")
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
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(PaymentTermsDesc; PaymentTerms.Description)
                    {
                    }
                    column(TaxRegLabel; TaxRegLabel)
                    {
                    }
                    column(TaxRegNo; TaxRegNo)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(CustTaxIdentificationType; Format(Cust."Tax Identification Type"))
                    {
                    }
                    column(SoldCaption; SoldCaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(ShipDateCaption; ShipDateCaptionLbl)
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
                    column(SalesOrderCaption; SalesOrderCaptionLbl)
                    {
                    }
                    column(SalesOrderNumberCaption; SalesOrderNumberCaptionLbl)
                    {
                    }
                    column(SalesOrderDateCaption; SalesOrderDateCaptionLbl)
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
                    column(PODateCaption; PODateCaptionLbl)
                    {
                    }
                    column(TaxIdentTypeCaption; TaxIdentTypeCaptionLbl)
                    {
                    }
                    column(DMECurrencyCaption; CurrencyCaptionLbl)
                    { }
                    column(DMECurrency_Code; "Sales Header"."Currency Code")
                    { }
                    column(DMECustRefNumbCaption; CustRefNumbCaptionLbl)
                    { }
                    column(DMEYour_Reference; "Sales Header"."Your Reference")
                    { }
                    column(DMEContactCaption; ContactCaptionLbl)
                    { }
                    column(DMESell_to_Contact; "Sales Header"."Sell-to Contact")
                    { }
                    column(DMESOTypeCaption; SOTypeCaptionLbl)
                    { }
                    column(DMESoType; SoType)
                    { }
                    column(DMEDocument_Type; "Sales Header"."Document Type")
                    { }
                    column(DMESONumbCaption; SONumbCaptionLbl)
                    { }
                    column(DMEOrder_No_; "Sales Header"."No.")
                    { }
                    column(DMEShipNumberCaption; ShipNumberCaptionLbl)
                    { }
                    column(DMEShipmentNo; ShipmentNo)
                    { }
                    column(DMECustPoNoCaption; CustPoNoCaptionLbl)
                    { }
                    column(DMECustPONo; CustPONo)
                    { }
                    column(DMETermsCaption; DMETermsCaption)
                    { }
                    column(DMEBillToCaption; BillToCaption)
                    { }
                    column(DMEShipToCaption; ShipToCaption)
                    { }
                    column(DMEReferenceCaption; ReferenceCaption)
                    { }
                    column(DMEDateCaption; DateCaption)
                    { }
                    column(DMEDueDateCaption; DMEDueDateCaption)
                    { }
                    column(DMECustomerIDCaption; DMECustomerIDCaption)
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
                    column(CompanyInformation_Phone; CompanyInformation."Phone No.")
                    { }
                    column(WebSiteCaption; WebSiteCaptionLbl)
                    { }
                    column(CompanyInformation_HomePage; CompanyInformation."Home Page")
                    { }
                    column(SalespersonText; SalespersonText)
                    { }
                    dataitem(SalesLine; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(AmountExclInvDisc; AmountExclInvDisc)
                        {
                        }
                        column(TempSalesLineNo; TempSalesLine."No.")
                        {
                        }
                        column(TempSalesLineUOM; TempSalesLine."Unit of Measure")
                        {
                        }
                        column(TempSalesLineQuantity; TempSalesLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(UnitPriceToPrint; UnitPriceToPrint)
                        {
                            DecimalPlaces = 2 : 5;
                        }
                        column(TempSalesLineDesc; TempSalesLine.Description + ' ' + TempSalesLine."Description 2")
                        {
                        }
                        column(TempSalesLineDocumentNo; TempSalesLine."Document No.")
                        {
                        }
                        column(TempSalesLineLineNo; TempSalesLine."Line No.")
                        {
                        }
                        column(AsmInfoExistsForLine; AsmInfoExistsForLine)
                        {
                        }
                        column(TaxLiable; TaxLiable)
                        {
                        }
                        column(TempSalesLineLineAmtTaxLiable; TempSalesLine."Line Amount" - TaxLiable)
                        {
                        }
                        column(TempSalesLineInvDiscAmt; TempSalesLine."Inv. Discount Amount")
                        {
                        }
                        column(TaxAmount; TaxAmount)
                        {
                        }
                        column(TempSalesLineLineAmtTaxAmtInvDiscAmt; TempSalesLine."Line Amount" + TaxAmount - TempSalesLine."Inv. Discount Amount")
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
                        column(BreakdownLabel3; BreakdownLabel[3])
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
                        column(AmtSubjecttoSalesTaxCptn; AmtSubjecttoSalesTaxCptnLbl)
                        {
                        }
                        column(AmtExemptfromSalesTaxCptn; AmtExemptfromSalesTaxCptnLbl)
                        {
                        }
                        column(DMENo_Caption; No_CaptionLbl)
                        { }
                        column(DMESequenceNo; SequenceNo)
                        { }
                        column(DMEItem_Caption; Item_CaptionLbl)
                        { }
                        column(DMEDisc_Caption; Disc_CaptionLbl)
                        { }
                        column(DMEUOm_Caption; UOm_CaptionLbl)
                        { }
                        column(DMEDisc_CaptionLbl; Disc_CaptionLbl)
                        { }
                        column(DMETempSalesLineRec_LineDisc; TempSalesLine."Line Discount %")
                        { }
                        column(DMEExtendedPriceCaptionLbl; ExtendedPriceCaptionLbl)
                        { }
                        column(DMEQtyCaptionLbl; QtyCaptionLbl)
                        { }
                        column(DMEUnitPriceCaptionLbl; DMEUnitPriceCaptionLbl)
                        { }
                        column(DMETempSalesLine_Description; TempSalesLine.Description)
                        { }
                        column(DescLineVarGbl; DescLineVarGbl)
                        { }

                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(AsmLineUnitOfMeasureText; GetUnitOfMeasureDescr(AsmLine."Unit of Measure Code"))
                            {
                            }
                            column(AsmLineQuantity; AsmLine.Quantity)
                            {
                            }
                            column(AsmLineDescription; BlanksForIndent() + AsmLine.Description)
                            {
                            }
                            column(AsmLineNo; BlanksForIndent() + AsmLine."No.")
                            {
                            }
                            column(AsmLineType; AsmLine.Type)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    AsmLine.FindSet()
                                else begin
                                    AsmLine.Next();
                                    TaxLiable := 0;
                                    TaxAmount := 0;
                                    AmountExclInvDisc := 0;
                                    TempSalesLine."Line Amount" := 0;
                                    TempSalesLine."Inv. Discount Amount" := 0;
                                end;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not AsmInfoExistsForLine then
                                    CurrReport.Break();
                                AsmLine.SetRange("Document Type", AsmHeader."Document Type");
                                AsmLine.SetRange("Document No.", AsmHeader."No.");
                                SetRange(Number, 1, AsmLine.Count);
                            end;
                        }
                        dataitem(ItemTrackingSpec; Integer)
                        {
                            DataItemTableView = sorting(Number);
                            DataItemLinkReference = SalesLine;
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
                                TempSalesLine."Line Amount" := 0;
                                TempSalesLine."Amount Including VAT" := 0;
                                TempSalesLine.Amount := 0;
                                TempSalesLine."Inv. Discount Amount" := 0;
                                AmountExclInvDisc := 0;
                                TaxLiable := 0;
                                TaxAmount := 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                TempTrackingSpecBuffer.SetRange("Source Ref. No.", TempSalesLine."Line No.");
                                if TempTrackingSpecBuffer.Count = 0 then
                                    CurrReport.Break();
                                SetRange(Number, 1, TempTrackingSpecBuffer.Count);

                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            SalesLine: Record "Sales Line";
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            DescLineVarGbl := false;
                            with TempSalesLine do begin
                                if OnLineNumber = 1 then
                                    Find('-')
                                else
                                    Next();

                                if "No." <> '' then
                                    SequenceNo += 1;

                                if Type = Type::" " then begin
                                    "No." := '';
                                    "Unit of Measure" := '';
                                    "Line Amount" := 0;
                                    "Inv. Discount Amount" := 0;
                                    Quantity := 0;
                                    DescLineVarGbl := true;
                                end else
                                    if Type = Type::"G/L Account" then
                                        "No." := '';


                                if "Tax Area Code" <> '' then
                                    TaxAmount := "Amount Including VAT" - Amount
                                else
                                    TaxAmount := 0;

                                if TaxAmount <> 0 then
                                    TaxLiable := Amount
                                else
                                    TaxLiable := 0;

                                OnAfterCalculateSalesTax("Sales Header", TempSalesLine, TaxAmount, TaxLiable); // Avalara

                                if AVAValidateCall.IsValidDocument("Sales Header") then begin
                                    TaxAmount := TempSalesLine."Ava Tax Amount";
                                    TaxLiable := TempSalesLine."Ava Taxable Amount";

                                    if "Sales Header".Status = "Sales Header".Status::Released then
                                        if TempSalesLine.Quantity <> TempSalesLine."Qty. to Invoice" then begin
                                            TaxAmount := (TempSalesLine.Amount * TempSalesLine."Ava Tax Rate" / 100);
                                            TaxLiable := TempSalesLine.Amount;
                                        end;
                                end;

                                AmountExclInvDisc := "Line Amount";

                                if Quantity = 0 then
                                    UnitPriceToPrint := 0 // so it won't print
                                else
                                    UnitPriceToPrint := Round(AmountExclInvDisc / Quantity, 0.00001);
                                if DisplayAssemblyInformation then begin
                                    AsmInfoExistsForLine := false;
                                    if TempSalesLineAsm.Get("Document Type", "Document No.", "Line No.") then begin
                                        SalesLine.Get("Document Type", "Document No.", "Line No.");
                                        AsmInfoExistsForLine := SalesLine.AsmToOrderExists(AsmHeader);
                                    end;
                                end;
                                GetSerialLotNo(TempSalesLine);
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            Clear(TaxLiable);
                            Clear(TaxAmount);
                            Clear(AmountExclInvDisc);

                            TempSalesLine.Reset();
                            NumberOfLines := TempSalesLine.Count();
                            SetRange(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyNo = NoLoops then begin
                        if not CurrReport.Preview then
                            SalesPrinted.Run("Sales Header");
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
                if PrintCompany then
                    if RespCenter.Get("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;

                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatDocumentFields("Sales Header");

                if not Cust.Get("Sell-to Customer No.") then
                    Clear(Cust);

                FormatAddress.SalesHeaderSellTo(BillToAddress, "Sales Header");
                FormatAddress.SalesHeaderShipTo(ShipToAddress, ShipToAddress, "Sales Header");

                if not CurrReport.Preview then begin
                    if ArchiveDocument then
                        ArchiveManagement.StoreSalesDocument("Sales Header", LogInteraction);

                    if LogInteraction then begin
                        CalcFields("No. of Archived Versions");
                        if "Bill-to Contact No." <> '' then
                            SegManagement.LogDocument(
                              3, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Contact, "Bill-to Contact No."
                              , "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                        else
                            SegManagement.LogDocument(
                              3, "No.", "Doc. No. Occurrence",
                              "No. of Archived Versions", DATABASE::Customer, "Bill-to Customer No.",
                              "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                    end;
                end;

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
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    end;
                    UseExternalTaxEngine := TaxArea."Use External Tax Engine";
                    SalesTaxCalc.StartSalesTaxCalculation();
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
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Archive Document';
                        Enabled = ArchiveDocumentEnable;
                        ToolTip = 'Specifies if the document is archived after you preview or print it.';

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
                        ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';

                        trigger OnValidate()
                        begin
                            if LogInteraction then
                                ArchiveDocument := ArchiveDocumentEnable;
                        end;
                    }
                    field("Display Assembly information"; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
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
            SalesSetup.Get();
            ArchiveDocument := SalesSetup."Archive Orders";
            LogInteraction := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Sales Ord. Cnfrmn.") <> '';

            ArchiveDocumentEnable := ArchiveDocument;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInformation.Get();
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        if PrintCompany then
            FormatAddress.Company(CompanyAddress, CompanyInformation)
        else
            Clear(CompanyAddress);
    end;

    var
        TaxLiable: Decimal;
        UnitPriceToPrint: Decimal;
        AmountExclInvDisc: Decimal;
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        TempSalesLine: Record "Sales Line" temporary;
        TempSalesLineAsm: Record "Sales Line" temporary;
        RespCenter: Record "Responsibility Center";
        TempSalesTaxAmtLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
        Cust: Record Customer;
        AsmHeader: Record "Assembly Header";
        AsmLine: Record "Assembly Line";
        Language: Codeunit Language;
        SalesPrinted: Codeunit "Sales-Printed";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        ArchiveManagement: Codeunit ArchiveManagement;
        SalesTaxCalc: Codeunit "Sales Tax Calculate";
        CompanyAddress: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CopyTxt: Text;
        SalespersonText: Text[50];
        PrintCompany: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        TaxAmount: Decimal;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        Text000: Label 'COPY';
        Text003: Label 'Sales Tax Breakdown:';
        Text004: Label 'Other Taxes';
        Text005: Label 'Total Sales Tax:';
        Text006: Label 'Tax Breakdown:';
        Text007: Label 'Total Tax:';
        Text008: Label 'Tax:';
        TaxRegNo: Text;
        TaxRegLabel: Text;
        TotalTaxLabel: Text;
        BreakdownTitle: Text;
        BreakdownLabel: array[4] of Text;
        BreakdownAmt: array[4] of Decimal;
        BrkIdx: Integer;
        PrevPrintOrder: Integer;
        PrevTaxPercent: Decimal;
        UseDate: Date;
        UseExternalTaxEngine: Boolean;
        [InDataSet]
        ArchiveDocumentEnable: Boolean;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmInfoExistsForLine: Boolean;
        SoldCaptionLbl: Label 'Sold';
        ToCaptionLbl: Label 'To:';
        ShipDateCaptionLbl: Label 'Ship Date';
        CustomerIDCaptionLbl: Label 'Customer ID';
        PONumberCaptionLbl: Label 'P.O. Number';
        SalesPersonCaptionLbl: Label 'SalesPerson: ';
        ShipCaptionLbl: Label 'Ship';
        SalesOrderCaptionLbl: Label 'SALES ORDER';
        SalesOrderNumberCaptionLbl: Label 'Sales Order Number:';
        SalesOrderDateCaptionLbl: Label 'Sales Order Date:';
        PageCaptionLbl: Label 'Page:';
        ShipViaCaptionLbl: Label 'Ship Via';
        TermsCaptionLbl: Label 'Terms';
        PODateCaptionLbl: Label 'P.O. Date';
        TaxIdentTypeCaptionLbl: Label 'Tax Ident. Type';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitPriceCaptionLbl: Label 'Unit Price';
        TotalPriceCaptionLbl: Label 'Total Price';
        SubtotalCaptionLbl: Label 'Subtotal:';
        InvoiceDiscountCaptionLbl: Label 'Discount Amount Excl. Tax:';
        TotalCaptionLbl: Label 'Total:';
        AmtSubjecttoSalesTaxCptnLbl: Label 'Amount Subject to Sales Tax';
        AmtExemptfromSalesTaxCptnLbl: Label 'Amount Exempt from Sales Tax';

        CurrencyCaptionLbl: Label 'Currency: ';
        CustRefNumbCaptionLbl: Label 'CUSTOMER REF. NO.';
        ContactCaptionLbl: Label 'CONTACT';
        SOTypeCaptionLbl: Label 'SO TYPE';
        SONumbCaptionLbl: Label 'SO NUMBER';
        ShipNumberCaptionLbl: Label 'SHIPMENT NUMBER';
        CustPoNoCaptionLbl: Label 'CUSTOMER P.O. NO.';
        No_CaptionLbl: Label 'NO.';
        Item_CaptionLbl: Label 'ITEM';
        UOm_CaptionLbl: Label 'UOM';
        Disc_CaptionLbl: Label 'DISC.';
        SoType: Code[10];
        ShipmentNo: Code[10];
        CustPONo: Code[35];
        SequenceNo: Integer;
        SpacePointerExt: Integer;
        HighestLineNoExt: Integer;
        OnLineNumberExt: Integer;
        NumberOfLinesExt: Integer;
        TempSalesLineRec: Record "Sales Line" temporary;
        ExtendedPriceCaptionLbl: Label 'EXTENDED PRICE';
        QtyCaptionLbl: Label 'QTY.';
        DMEUnitPriceCaptionLbl: Label 'UNIT PRICE';
        DMETermsCaption: Label 'TERMS';
        BillToCaption: Label 'BILL TO:';
        ShipToCaption: Label 'SHIP TO:';
        ReferenceCaption: Label 'Reference No.:';
        DateCaption: Label 'Date:';
        DMEDueDateCaption: Label 'Due Date:';
        DMECustomerIDCaption: Label 'Customer ID:';
        FormatDocumentExt: Codeunit "Format Document";
        Total_Caption: Text;
        FormatAddressExt: Codeunit "Format Address";
        CompInfoExt: Record "Company Information";
        CompanyAddressExt: array[8] of Text[100];
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        LotNo: Text;
        DescLineVarGbl: Boolean;
        AVAValidateCall: Codeunit "AVA Validate Call";
        WebSiteCaptionLbl: Label 'Website: ';
        PhoneNoCapLbl: Label 'Phone No: ';



    procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[10]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header")
    begin
        with SalesHeader do begin
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalespersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");
        end;
    end;

    local procedure InsertTempLine(Comment: Text[80]; IncrNo: Integer)
    begin
        with TempSalesLine do begin
            Init();
            "Document Type" := "Sales Header"."Document Type";
            "Document No." := "Sales Header"."No.";
            "Line No." := HighestLineNo + IncrNo;
            HighestLineNo := "Line No.";
        end;
        FormatDocument.ParseComment(Comment, TempSalesLine.Description, TempSalesLine."Description 2");
        TempSalesLine.Insert();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalculateSalesTax(var SalesHeaderParm: Record "Sales Header"; var SalesLineParm: Record "Sales Line"; var TaxAmount: Decimal; var TaxLiable: Decimal)
    begin
    end;

    local procedure GetSerialLotNo(TempSalesLine: Record "Sales Line" temporary)
    var
        ItemTrackDocMgmt: Codeunit "Item Tracking Doc. Management";
    begin
        clear(TempTrackingSpecBuffer);
        TempTrackingSpecBuffer.DeleteAll();

        ItemTrackDocMgmt.RetrieveDocumentItemTracking(TempTrackingSpecBuffer, TempSalesLine."Document No.", Database::"Sales Header", TempSalesLine."Document Type".AsInteger());
    end;

}

