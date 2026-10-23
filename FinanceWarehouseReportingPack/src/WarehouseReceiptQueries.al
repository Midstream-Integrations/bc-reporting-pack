query 50211 "MID Whse. Receipts Outstanding"
{
    Caption = 'Warehouse Receipts Outstanding';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    elements
    {
        dataitem(WarehouseReceiptLine; "Warehouse Receipt Line")
        {
            column(ReceiptNo; "No.") { }
            column(SourceNo; "Source No.") { }
            column(SourceDocument; "Source Document") { }
            column(LocationCode; "Location Code") { }
            column(ItemNo; "Item No.") { }
            column(ItemDescription; Description) { }
            column(UOM; "Unit of Measure Code") { }
            column(Quantity; Quantity) { }
            column(QuantityOutstanding; "Qty. Outstanding") { }
            column(QuantityToReceive; "Qty. to Receive") { }
            column(QuantityReceived; "Qty. Received") { }
            column(Status; Status) { }
            column(DueDate; "Due Date") { }
            column(StartingDate; "Starting Date") { }
            dataitem(PurchaseHeader; "Purchase Header")
            {
                DataItemLink = "No." = WarehouseReceiptLine."Source No.";
                DataItemTableFilter = "Document Type" = const(Order);
                SqlJoinType = LeftOuterJoin;
                column(VendorNo; "Buy-from Vendor No.") { }
                column(VendorName; "Buy-from Vendor Name") { }
            }
        }
    }
}

query 50212 "MID Posted Receipts Invoicing"
{
    Caption = 'Posted Receipts - Invoicing Status';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    elements
    {
        dataitem(ReceiptLine; "Purch. Rcpt. Line")
        {
            DataItemTableFilter = Type = const(Item);
            column(ReceiptNo; "Document No.") { }
            column(OrderNo; "Order No.") { }
            column(PostingDate; "Posting Date") { }
            column(LocationCode; "Location Code") { }
            column(ItemNo; "No.") { }
            column(ItemDescription; Description) { }
            column(UOM; "Unit of Measure Code") { }
            column(Quantity; Quantity) { }
            column(QuantityInvoiced; "Quantity Invoiced") { }
            column(QtyRcdNotInvoiced; "Qty. Rcd. Not Invoiced") { }
            column(VendorNo; "Buy-from Vendor No.") { }
            dataitem(Vendor; Vendor)
            {
                DataItemLink = "No." = ReceiptLine."Buy-from Vendor No.";
                SqlJoinType = LeftOuterJoin;
                column(VendorName; Name) { }
            }
        }
    }
}

permissionset 50210 "MID REPORTING PACK"
{
    Assignable = true;
    Caption = 'Finance and Warehouse Reporting Pack';
    Permissions =
        page "MID G/L Entries Audit View" = X,
        query "MID Whse. Receipts Outstanding" = X,
        query "MID Posted Receipts Invoicing" = X,
        tabledata "G/L Entry" = R,
        tabledata User = R,
        tabledata "Warehouse Receipt Line" = R,
        tabledata "Purchase Header" = R,
        tabledata "Purch. Rcpt. Line" = R,
        tabledata Vendor = R;
}
