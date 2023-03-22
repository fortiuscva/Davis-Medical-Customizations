report 52607 "DME Work Order"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/DMEWorkOrder.rdl';
    Caption = 'DME Work Order';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.";
            RequestFilterHeading = 'Sales Order';
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(No1_SalesHeader; "Sales Header"."No.")
                {
                }
                column(ShipmentDate_SalesHeader; Format("Sales Header"."Shipment Date"))
                {
                }
                column(CompanyName; COMPANYPROPERTY.DisplayName())
                {
                }
                column(CompanyInformation_Picture; CompanyInformation.Picture)
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
                column(CompanyAddress7; CompanyAddress[7])
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CustAddr7; CustAddr[7])
                {
                }
                column(CustAddr8; CustAddr[8])
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
                column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                {
                }
                column(SalesOrderNoCaption; SalesOrderNoCaptionLbl)
                {
                }
                column(PageNoCaption; PageNoCaptionLbl)
                {
                }
                column(WorkOrderCaption; WorkOrderCaptionLbl)
                {
                }
                column(DMESell_to_Contact; "Sales Header"."Sell-to Contact")
                { }
                column(Order_Date; "Sales Header"."Order Date")
                { }
                column(WorkOrderNo; WorkOrderNo)
                { }
                column(BillTo_Caption; BillTo_CaptionLbl)
                { }
                column(ShipTo_Caption; ShipTo_CaptionLbl)
                { }
                column(CustContactCaption; CustContactCaptionLbl)
                { }
                column(PoNoCaption; PoNoCaptionLbl)
                { }
                column(PONo; PONo)
                { }
                column(TermsCaption; TermsCaptionLbl)
                { }
                column(PaymentTermsDesc; PaymentTerms.Description)
                { }
                column(ServiceType_Caption; ServiceType_CaptionLbl)
                { }
                column(ServiceType; ServiceType)
                { }
                column(ServiceAdvisor_Caption; ServiceAdvisor_CaptionLbl)
                { }
                column(ServiceAdvisor; ServiceAdvisor)
                { }
                column(ServiceDate_Caption; ServiceDate_CaptionLbl)
                { }
                column(ServiceDate; ServiceDate)
                { }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(Work_OrderCaption; Work_OrderCaptionLbl)
                { }
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                    column(No_SalesLine; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_SalesLine; Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitofMeasure_SalesLine; "Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(Type_SalesLine; Type)
                    {
                        IncludeCaption = true;
                    }
                    column(QtyworkPostSalesOrderCptn; QtyworkPostSalesOrderCptnLbl)
                    {
                    }
                    column(QuantityUsedCaption; QuantityUsedCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaption; UnitofMeasureCaptionLbl)
                    {
                    }
                    column(SL_Unit_Price; "Sales Line"."Unit Price")
                    { }
                    column(SL_AMount; "Sales Line"."Amount Including VAT")
                    { }
                    column(Item_Caption; Item_CaptionLbl)
                    { }
                    column(Ordered_Caption; Ordered_CaptionLbl)
                    { }
                    column(Rate_Caption; Rate_CaptionLbl)
                    { }
                    column(Amount_Caption; Amount_CaptionLbl)
                    { }
                    column(Total_Caption; Total_CaptionLbl)
                    { }
                    column(GrandTotal; GrandTotal)
                    { }

                    trigger OnAfterGetRecord()
                    begin
                        GrandTotal += "Sales Line"."Amount Including VAT";
                    end;

                }
                dataitem("Sales Comment Line"; "Sales Comment Line")
                {
                    DataItemLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = WHERE("Document Line No." = CONST(0));
                    column(Date_SalesCommentLine; Format(Date))
                    {
                    }
                    column(Code_SalesCommentLine; Code)
                    {
                        IncludeCaption = true;
                    }
                    column(Comment_SalesCommentLine; Comment)
                    {
                        IncludeCaption = true;
                    }
                    column(CommentsCaption; CommentsCaptionLbl)
                    {
                    }
                    column(SalesCommentLineDtCptn; SalesCommentLineDtCptnLbl)
                    {
                    }

                }
                dataitem("Extra Lines"; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(NoCaption; NoCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(QuantityCaption; QuantityCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaptionControl33; UnitofMeasureCaptionControl33Lbl)
                    {
                    }

                    column(workPostdItemorResJnlCptn; workPostdItemorResJnlCptnLbl)
                    {
                    }
                    column(TypeCaption; TypeCaptionLbl)
                    {
                    }
                }
            }

            trigger OnAfterGetRecord()
            begin
                Clear(GrandTotal);
                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);

                FormatAddr.SalesHeaderBillTo(CustAddr, "Sales Header");
                FormatAddr.SalesHeaderSellTo(BillToAddress, "Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddress, ShipToAddress, "Sales Header");
                FormatAddr.Company(CompanyAddress, CompanyInformation);
                FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            end;
        }
    }

    var
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        CompanyInformation: Record "Company Information";
        CustAddr: array[8] of Text[100];
        BillToAddress: array[8] of Text[100];
        ShipToAddress: array[8] of Text[100];
        CompanyAddress: array[8] of Text[100];
        ShipmentDateCaptionLbl: Label 'Shipment Date';
        SalesOrderNoCaptionLbl: Label 'Sales Order No.';
        PageNoCaptionLbl: Label 'Page';
        WorkOrderCaptionLbl: Label 'W.O. No.';
        QtyworkPostSalesOrderCptnLbl: Label 'Quantity used during work (Posted with the Sales Order)';
        QuantityUsedCaptionLbl: Label 'Quantity Used';
        UnitofMeasureCaptionLbl: Label 'U/M';
        CommentsCaptionLbl: Label 'Comments';
        SalesCommentLineDtCptnLbl: Label 'Date';
        NoCaptionLbl: Label 'No.';
        DescriptionCaptionLbl: Label 'Description';
        QuantityCaptionLbl: Label 'Quantity';
        UnitofMeasureCaptionControl33Lbl: Label 'U/M';
        DateCaptionLbl: Label 'Date';
        workPostdItemorResJnlCptnLbl: Label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        TypeCaptionLbl: Label 'Type';
        PoNoCaptionLbl: Label 'P.O. No.';
        CustContactCaptionLbl: Label 'Customer Contact';
        TermsCaptionLbl: Label 'Terms';
        ServiceType_CaptionLbl: Label 'Service Type';
        ServiceAdvisor_CaptionLbl: Label 'Service Advisor';
        ServiceDate_CaptionLbl: Label 'Service Date';
        CustSignatureCaptionLbl: Label 'Customer Signature';
        BillTo_CaptionLbl: Label 'BILL TO:';
        ShipTo_CaptionLbl: Label 'SHIP TO:';
        PaymentTerms: Record "Payment Terms";
        WorkOrderNo: Code[20];
        PONo: Code[20];
        ServiceType: Text;
        ServiceAdvisor: Text;
        ServiceDate: Date;
        Work_OrderCaptionLbl: Label 'Work Order';
        Item_CaptionLbl: Label 'Item';
        Ordered_CaptionLbl: Label 'Ordered';
        Rate_CaptionLbl: Label 'Rate';
        Amount_CaptionLbl: Label 'Amount';
        Total_CaptionLbl: Label 'Total';
        GrandTotal: Decimal;
}

