page 50210 "MID G/L Entries Audit View"
{
    Caption = 'G/L Entries - Audit View';
    PageType = List;
    SourceTable = "G/L Entry";
    SourceTableView = sorting("Entry No.") order(descending);
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Document No."; Rec."Document No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("G/L Account No."; Rec."G/L Account No.") { }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code") { }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code") { }
                field(Description; Rec.Description) { }
                field("Debit Amount"; Rec."Debit Amount") { }
                field("Credit Amount"; Rec."Credit Amount") { }
                field(Amount; Rec.Amount) { }
                field("Document Type"; Rec."Document Type") { }
                field("Source No."; Rec."Source No.") { }
                field("External Document No."; Rec."External Document No.") { }
                field("Bal. Account Type"; Rec."Bal. Account Type") { }
                field("Bal. Account No."; Rec."Bal. Account No.") { }
                field("Gen. Posting Type"; Rec."Gen. Posting Type") { }
                field("Source Code"; Rec."Source Code") { }
                field(SystemCreatedAt; Rec.SystemCreatedAt) { Caption = 'Created At'; ToolTip = 'When the entry was created.'; }
                field(CreatedBy; CreatedByName) { Caption = 'Created By'; ToolTip = 'User who created the entry.'; }
                field(SystemModifiedAt; Rec.SystemModifiedAt) { Caption = 'Modified At'; ToolTip = 'When the entry was last changed.'; }
                field(ModifiedBy; ModifiedByName) { Caption = 'Modified By'; ToolTip = 'User who last changed the entry.'; }
            }
        }
    }

    var
        UserNames: Dictionary of [Guid, Text];
        CreatedByName: Text;
        ModifiedByName: Text;

    trigger OnAfterGetRecord()
    begin
        CreatedByName := UserName(Rec.SystemCreatedBy);
        ModifiedByName := UserName(Rec.SystemModifiedBy);
    end;

    // one lookup per user, cached for the page session
    local procedure UserName(UserSecId: Guid): Text
    var
        User: Record User;
        Name: Text;
    begin
        if UserNames.Get(UserSecId, Name) then
            exit(Name);
        if User.Get(UserSecId) then
            Name := User."User Name"
        else
            if IsNullGuid(UserSecId) then
                Name := ''
            else
                Name := Format(UserSecId);
        UserNames.Add(UserSecId, Name);
        exit(Name);
    end;
}
