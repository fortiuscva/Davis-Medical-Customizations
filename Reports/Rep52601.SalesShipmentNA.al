report 52601 "DME Sales Shipment NA"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/DMESalesShipmentNA.rdl';
    Caption = 'DME Sales Shipment';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeading = 'Sales Shipment';
            column(No_SalesShptHeader; "No.")
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                dataitem(SalesLineComments; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No."), "Document Line No." = FIELD("Line No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST(Shipment), "Print On Shipment" = CONST(true));

                    trigger OnAfterGetRecord()
                    begin
                        InsertTempLine(Comment, 10);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    TempSalesShipmentLine := "Sales Shipment Line";
                    TempSalesShipmentLine.Insert();
                    TempSalesShipmentLineAsm := "Sales Shipment Line";
                    TempSalesShipmentLineAsm.Insert();
                    HighestLineNo := "Line No.";
                end;

                trigger OnPreDataItem()
                begin
                    TempSalesShipmentLine.Reset();
                    TempSalesShipmentLine.DeleteAll();
                    TempSalesShipmentLineAsm.Reset();
                    TempSalesShipmentLineAsm.DeleteAll();
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = CONST(Shipment), "Print On Shipment" = CONST(true), "Document Line No." = CONST(0));

                trigger OnAfterGetRecord()
                begin
                    InsertTempLine(Comment, 1000);
                end;

                trigger OnPreDataItem()
                begin
                    with TempSalesShipmentLine do begin
                        Init();
                        "Document No." := "Sales Shipment Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;
                    TempSalesShipmentLine.Insert();
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
                    column(BilltoCustNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.")
                    {
                    }
                    column(ExtDocNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ShptDate_SalesShptHeader; "Sales Shipment Header"."Shipment Date")
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
                    column(OrderDate_SalesShptHeader; "Sales Shipment Header"."Order Date")
                    {
                    }
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(PackageTrackingNoText; PackageTrackingNoText)
                    {
                    }
                    column(ShippingAgentCodeText; ShippingAgentCodeText)
                    {
                    }
                    column(ShippingAgentCodeLabel; ShippingAgentCodeLabel)
                    {
                    }
                    column(PackageTrackingNoLabel; PackageTrackingNoLabel)
                    {
                    }
                    column(TaxRegNo; TaxRegNo)
                    {
                    }
                    column(TaxRegLabel; TaxRegLabel)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(PageLoopNumber; Number)
                    {
                    }
                    column(BillCaption; BillCaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
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
                    column(ShipmentCaption; ShipmentCaptionLbl)
                    {
                    }
                    column(ShipmentNumberCaption; ShipmentNumberCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(ShipViaCaption; ShipViaCaptionLbl)
                    {
                    }
                    column(PODateCaption; PODateCaptionLbl)
                    {
                    }
                    column(OurOrderNoCaption; OurOrderNoCaptionLbl)
                    {
                    }
                    column(DMEShipmentConfirm_Caption; ShipmentConfirm_CaptionLbl)
                    { }
                    column(DMENote_Caption; Note_CaptionLbl)
                    { }
                    column(DMEContact_Caption; Contact_CaptionLbl)
                    { }
                    column(DMESell_to_Contact; "Sales Shipment Header"."Sell-to Contact")
                    { }
                    column(DMEFOB_Point_Caption; FOB_Point_CaptionLbl)
                    { }
                    column(DMEFOBPoint; FOBPoint)
                    { }
                    column(DMEWarehouse_Caption; Warehouse_CaptionLbl)
                    { }
                    column(DMEWarehouseInfo; WarehouseInfo)
                    { }
                    column(DMESOTypeCaption; SOTypeCaptionLbl)
                    { }
                    column(DMESoType; SoType)
                    { }
                    column(DMESONumbCaption; SONumbCaptionLbl)
                    { }
                    column(DMEOrder_No_; "Sales Shipment Header"."Order No.")
                    { }
                    column(DMECustPoNoCaption; CustPoNoCaptionLbl)
                    { }
                    column(DMECustPONo; CustPONo)
                    { }
                    column(DMEReferenceNo_Caption; ReferenceNo_CaptionLbl)
                    { }
                    column(DMEDate_Caption; Date_CaptionLbl)
                    { }
                    column(DMECust_ID_Caption; Cust_ID_CaptionLbl)
                    { }
                    column(DMEShip_To_Caption; Ship_To_CaptionLbl)
                    { }
                    column(DMEShip_Via_Caption; Ship_Via_CaptionLbl)
                    { }
                    column(DMENo_Caption; No_CaptionLbl)
                    { }
                    column(DMEItem_Caption; Item_CaptionLbl)
                    { }
                    column(DMEQtyCaption; QtyCaptionLbl)
                    { }
                    column(DMEUOm_Caption; UOm_CaptionLbl)
                    { }
                    column(DMEQty_Shipped_Caption; Qty_Shipped_CaptionLbl)
                    { }
                    column(DMEQty_BO_Caption; Qty_BO_CaptionLbl)
                    { }
                    column(DMETOtal_Qty_Caption; TOtal_Qty_CaptionLbl)
                    { }
                    column(DMETotal_Weight_Caption; Total_Weight_CaptionLbl)
                    { }
                    column(DMETotal_Volume_Caption; Total_Volume_CaptionLbl)
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

                    dataitem(SalesShptLine; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesShptLineNumber; Number)
                        {
                        }
                        column(TempSalesShptLineNo; TempSalesShipmentLine."No.")
                        {
                        }
                        column(TempSalesShptLineUOM; TempSalesShipmentLine."Unit of Measure")
                        {
                        }
                        column(TempSalesShptLineQy; TempSalesShipmentLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(OrderedQuantity; OrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(BackOrderedQuantity; BackOrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(TempSalesShptLineDesc; TempSalesShipmentLine.Description + ' ' + TempSalesShipmentLine."Description 2")
                        {
                        }
                        column(PackageTrackingText; PackageTrackingText)
                        {
                        }
                        column(AsmHeaderExists; AsmHeaderExists)
                        {
                        }
                        column(PrintFooter; PrintFooter)
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
                        column(ShippedCaption; ShippedCaptionLbl)
                        {
                        }
                        column(OrderedCaption; OrderedCaptionLbl)
                        {
                        }
                        column(BackOrderedCaption; BackOrderedCaptionLbl)
                        {
                        }
                        column(DMESequenceNo; SequenceNo)
                        { }
                        column(DMETotalQty; TotalQty)
                        { }
                        column(DMETotalVolume; TotalVolume)
                        { }
                        column(DMETotalWeight; TotalWeight)
                        { }
                        column(DMETempSalesShipmentLine_Description; TempSalesShipmentLine.Description)
                        { }
                        column(DescLineVarGbl; DescLineVarGbl)
                        { }
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(PostedAsmLineItemNo; BlanksForIndent() + PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; BlanksForIndent() + PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; GetUnitOfMeasureDescr(PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then
                                    PostedAsmLine.FindSet()
                                else
                                    PostedAsmLine.Next();
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.Break();
                                if not AsmHeaderExists then
                                    CurrReport.Break();
                                if not TempSalesShipmentLineAsm.Get(TempSalesShipmentLine."Document No.", TempSalesShipmentLine."Line No.") then
                                    CurrReport.Break();
                                PostedAsmLine.SetRange("Document No.", PostedAsmHeader."No.");
                                SetRange(Number, 1, PostedAsmLine.Count);
                            end;
                        }
                        dataitem(ItemTrackingSpec; Integer)
                        {
                            DataItemTableView = sorting(Number);
                            DataItemLinkReference = SalesShptLine;
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
                                TempTrackingSpecBuffer.SetRange("Source Ref. No.", TempSalesShipmentLine."Line No.");
                                if TempTrackingSpecBuffer.Count = 0 then
                                    CurrReport.Break();
                                SetRange(Number, 1, TempTrackingSpecBuffer.Count);
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            SalesShipmentLine: Record "Sales Shipment Line";
                        begin
                            OnLineNumber := OnLineNumber + 1;
                            DescLineVarGbl := false;
                            with TempSalesShipmentLine do begin
                                if OnLineNumber = 1 then
                                    Find('-')
                                else
                                    Next();

                                OrderedQuantity := 0;
                                BackOrderedQuantity := 0;
                                if "Order No." = '' then
                                    OrderedQuantity := Quantity
                                else
                                    if OrderLine.Get(1, "Order No.", "Order Line No.") then begin
                                        OrderedQuantity := OrderLine.Quantity;
                                        BackOrderedQuantity := OrderLine."Outstanding Quantity";
                                    end else begin
                                        ReceiptLine.SetCurrentKey("Order No.", "Order Line No.");
                                        ReceiptLine.SetRange("Order No.", "Order No.");
                                        ReceiptLine.SetRange("Order Line No.", "Order Line No.");
                                        ReceiptLine.Find('-');
                                        repeat
                                            OrderedQuantity := OrderedQuantity + ReceiptLine.Quantity;
                                        until 0 = ReceiptLine.Next();
                                    end;

                                if "No." <> '' then
                                    SequenceNo += 1;

                                if Type = Type::" " then begin
                                    OrderedQuantity := 0;
                                    BackOrderedQuantity := 0;
                                    "No." := '';
                                    "Unit of Measure" := '';
                                    Quantity := 0;
                                    DescLineVarGbl := true;
                                end else
                                    if Type = Type::"G/L Account" then
                                        "No." := '';
                                PackageTrackingText := '';
                                if ("Package Tracking No." <> "Sales Shipment Header"."Package Tracking No.") and
                                   ("Package Tracking No." <> '') and PrintPackageTrackingNos
                                then
                                    PackageTrackingText := Text002 + ' ' + "Package Tracking No.";

                                if DisplayAssemblyInformation then
                                    if TempSalesShipmentLineAsm.Get("Document No.", "Line No.") then begin
                                        SalesShipmentLine.Get("Document No.", "Line No.");
                                        AsmHeaderExists := SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader);
                                    end;

                                TotalQty += TempSalesShipmentLineRec.Quantity;
                            end;

                            GetSerialLotNo(TempSalesShipmentLineRec);

                            if OnLineNumber = NumberOfLines then
                                PrintFooter := true;
                        end;

                        trigger OnPreDataItem()
                        begin
                            NumberOfLines := TempSalesShipmentLine.Count();
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
                            SalesShipmentPrinted.Run("Sales Shipment Header");
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

                if "Salesperson Code" = '' then
                    Clear(SalesPurchPerson)
                else
                    SalesPurchPerson.Get("Salesperson Code");

                if "Shipment Method Code" = '' then
                    Clear(ShipmentMethod)
                else
                    ShipmentMethod.Get("Shipment Method Code");

                if "Sell-to Customer No." = '' then begin
                    "Bill-to Name" := Text009;
                    "Ship-to Name" := Text009;
                end;
                if not Cust.Get("Sell-to Customer No.") then
                    Clear(Cust);

                FormatAddress.SalesShptBillTo(BillToAddress, BillToAddress, "Sales Shipment Header");
                FormatAddress.SalesShptShipTo(ShipToAddress, "Sales Shipment Header");

                ShippingAgentCodeLabel := '';
                ShippingAgentCodeText := '';
                PackageTrackingNoLabel := '';
                PackageTrackingNoText := '';
                if PrintPackageTrackingNos then begin
                    ShippingAgentCodeLabel := Text003;
                    ShippingAgentCodeText := "Sales Shipment Header"."Shipping Agent Code";
                    PackageTrackingNoLabel := Text001;
                    PackageTrackingNoText := "Sales Shipment Header"."Package Tracking No.";
                end;
                if LogInteraction then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          5, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.",
                          "Salesperson Code", "Campaign No.", "Posting Description", '');
                TaxRegNo := '';
                TaxRegLabel := '';
                if "Tax Area Code" <> '' then begin
                    TaxArea.Get("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            ;
                        TaxArea."Country/Region"::CA:
                            begin
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FieldCaption("VAT Registration No.");
                            end;
                    end;
                end;
                CompInfoExt.Get();
                FormatAddressExt.FormatAddr(CompanyAddressExt, '', '', '', CompInfoExt.Address,
                            CompInfoExt."Address 2", CompInfoExt.City, CompInfoExt."Post Code",
                            CompInfoExt.County, '');
                CompanyAddressExt[7] := PhoneNoCapLbl + CompInfoExt."Phone No.";
                CompanyAddressExt[8] := WebSiteCaptionLbl + CompInfoExt."Home Page";
                CompressArray(CompanyAddressExt);
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
                    field(PrintPackageTrackingNos; PrintPackageTrackingNos)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Print Package Tracking Nos.';
                        ToolTip = 'Specifies if you want the individual package tracking numbers to be printed on each line.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
                    }
                    field(DisplayAsmInfo; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies that you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
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
            InitLogInteraction();
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        SalesSetup.Get();

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo3.Get();
                    CompanyInfo3.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction();

        CompanyInformation.Get();
        SalesSetup.Get();

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                CompanyInformation.CalcFields(Picture);
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.Get();
                    CompanyInfo1.CalcFields(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.Get();
                    CompanyInfo2.CalcFields(Picture);
                end;
        end;

        if PrintCompany then
            FormatAddress.Company(CompanyAddress, CompanyInformation)
        else
            Clear(CompanyAddress);
    end;

    var
        OrderedQuantity: Decimal;
        BackOrderedQuantity: Decimal;
        ShipmentMethod: Record "Shipment Method";
        ReceiptLine: Record "Sales Shipment Line";
        OrderLine: Record "Sales Line";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        TempSalesShipmentLine: Record "Sales Shipment Line" temporary;
        TempSalesShipmentLineAsm: Record "Sales Shipment Line" temporary;
        RespCenter: Record "Responsibility Center";
        TaxArea: Record "Tax Area";
        Cust: Record Customer;
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        Language: Codeunit Language;
        SalesShipmentPrinted: Codeunit "Sales Shpt.-Printed";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
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
        PackageTrackingText: Text;
        PrintPackageTrackingNos: Boolean;
        PackageTrackingNoText: Text;
        PackageTrackingNoLabel: Text;
        ShippingAgentCodeText: Text;
        ShippingAgentCodeLabel: Text;
        LogInteraction: Boolean;
        Text000: Label 'COPY';
        Text001: Label 'Tracking No.';
        Text002: Label 'Specific Tracking No.';
        Text003: Label 'Shipping Agent';
        TaxRegNo: Text;
        TaxRegLabel: Text;
        Text009: Label 'VOID SHIPMENT';
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmHeaderExists: Boolean;
        BillCaptionLbl: Label 'Bill';
        ToCaptionLbl: Label 'To:';
        CustomerIDCaptionLbl: Label 'Customer ID';
        PONumberCaptionLbl: Label 'P.O. Number';
        SalesPersonCaptionLbl: Label 'SalesPerson';
        ShipCaptionLbl: Label 'Ship';
        ShipmentCaptionLbl: Label 'SHIPMENT';
        ShipmentNumberCaptionLbl: Label 'Shipment Number:';
        ShipmentDateCaptionLbl: Label 'Shipment Date:';
        PageCaptionLbl: Label 'Page:';
        ShipViaCaptionLbl: Label 'Ship Via';
        PODateCaptionLbl: Label 'P.O. Date';
        OurOrderNoCaptionLbl: Label 'Our Order No.';
        ItemNoCaptionLbl: Label 'Item No.';
        UnitCaptionLbl: Label 'Unit';
        DescriptionCaptionLbl: Label 'Description';
        ShippedCaptionLbl: Label 'Shipped';
        OrderedCaptionLbl: Label 'Ordered';
        BackOrderedCaptionLbl: Label 'Back Ordered';
        ShipmentConfirm_CaptionLbl: Label 'Shipment Confirmation';
        Note_CaptionLbl: Label 'NOTE:';
        Contact_CaptionLbl: Label 'CONTACT';
        FOB_Point_CaptionLbl: Label 'FOB POINT';
        Warehouse_CaptionLbl: Label 'WAREHOUSE';
        SOTypeCaptionLbl: Label 'SO TYPE';
        SONumbCaptionLbl: Label 'SO NUMBER';
        CustPoNoCaptionLbl: Label 'CUSTOMER P.O. No.';
        ReferenceNo_CaptionLbl: Label 'Reference Number:';
        Date_CaptionLbl: Label 'Date:';
        Cust_ID_CaptionLbl: Label 'Customer ID:';
        Ship_To_CaptionLbl: Label 'SHIP TO:';
        Ship_Via_CaptionLbl: Label 'SHIP VIA';
        No_CaptionLbl: Label 'NO.';
        Item_CaptionLbl: Label 'ITEM';
        UOm_CaptionLbl: Label 'UOM';
        QtyCaptionLbl: Label 'QTY.';
        Qty_Shipped_CaptionLbl: Label 'QTY. SHIPPED';
        Qty_BO_CaptionLbl: Label 'QTY. B/O';
        TOtal_Qty_CaptionLbl: Label 'Total Qty:';
        Total_Weight_CaptionLbl: Label 'Total Weight (LB):';
        Total_Volume_CaptionLbl: Label 'Total Volume (SQFT):';
        CustPONo: Code[35];
        SoType: Code[10];
        FOBPoint: Code[10];
        WarehouseInfo: Code[10];
        SequenceNo: Integer;
        TempSalesShipmentLineRec: Record "Sales Shipment Line" temporary;
        SpacePointerExt: Integer;
        HighestLineNoExt: Integer;
        OnLineNumberExt: Integer;
        NumberOfLinesExt: Integer;
        FormatDocumentExt: Codeunit "Format Document";
        PrintFooterExt: Boolean;
        TotalQty: Decimal;
        TotalWeight: Decimal;
        TotalVolume: Decimal;
        FormatAddressExt: Codeunit "Format Address";
        CompInfoExt: Record "Company Information";
        CompanyAddressExt: array[8] of Text[100];
        TempTrackingSpecBuffer: Record "Tracking Specification" temporary;
        LotNo: Text;
        DescLineVarGbl: Boolean;
        WebSiteCaptionLbl: Label 'Website: ';
        PhoneNoCapLbl: Label 'Phone No: ';


    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractionTemplateCode("Interaction Log Entry Document Type"::"Sales Shpt. Note") <> '';
    end;

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

    local procedure InsertTempLine(Comment: Text[80]; IncrNo: Integer)
    begin
        with TempSalesShipmentLine do begin
            Init();
            "Document No." := "Sales Shipment Header"."No.";
            "Line No." := HighestLineNo + IncrNo;
            HighestLineNo := "Line No.";
        end;
        FormatDocument.ParseComment(Comment, TempSalesShipmentLine.Description, TempSalesShipmentLine."Description 2");
        TempSalesShipmentLine.Insert();
    end;

    local procedure GetSerialLotNo(TempSalesShipmentLine: Record "Sales Shipment Line" temporary)
    var
        ItemTrackDocMgmt: Codeunit "Item Tracking Doc. Management";
    begin
        Clear(TempTrackingSpecBuffer);
        TempTrackingSpecBuffer.DeleteAll();

        ItemTrackDocMgmt.RetrieveDocumentItemTracking(TempTrackingSpecBuffer, "Sales Shipment Header"."No.", DATABASE::"Sales Shipment Header", 0);
    end;
}