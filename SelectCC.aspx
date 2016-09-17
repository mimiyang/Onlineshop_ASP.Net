<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelectCC.aspx.cs" Inherits="SelectCC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CC_No], [FirstName], [MiddleInitial], [Expiration], [CC_Type], [CVC], [UserID] FROM [CreditCard] WHERE ([UserID] = @UserID)" DeleteCommand="DELETE FROM [CreditCard] WHERE ([CC_No] = @CC_No)">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="CC_No" SessionField="UserID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="Your Credit Cards" DataKeyNames="CC_No" DataSourceID="SqlDataSource1" EmptyDataText="We do not have your Credit Card details" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="CC_No" HeaderText="CC_No" ReadOnly="True" SortExpression="CC_No" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="MiddleInitial" HeaderText="MiddleInitial" SortExpression="MiddleInitial" />
            <asp:BoundField DataField="Expiration" HeaderText="Expiration" SortExpression="Expiration" />
            <asp:BoundField DataField="CC_Type" HeaderText="CC_Type" SortExpression="CC_Type" />
            <asp:BoundField DataField="CVC" HeaderText="CVC" SortExpression="CVC" />
            <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
            <asp:CommandField HeaderText="Remove" ShowDeleteButton="True" ShowHeader="True" />
        </Columns>
    </asp:GridView>

    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/addCC.aspx">Add Credit Card</asp:HyperLink>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/shopcart.aspx">Go Back</asp:HyperLink>
    </p>
</asp:Content>

