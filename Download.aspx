<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select OrderID,
OrderLine.SongID,
Title, Album,
Artist, ListPrice,
FileName from OrderLine inner join Song 
on OrderLine.SongID = Song.SongID
Where OrderID = @OrderID">
        <SelectParameters>
            <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,SongID" DataSourceID="SqlDataSource1" OnUnload="GridView1_Unload">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="SongID" HeaderText="SongID" ReadOnly="True" SortExpression="SongID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Album" HeaderText="Album" SortExpression="Album" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
            <asp:HyperLinkField DataNavigateUrlFields="FileName" DataNavigateUrlFormatString="~/songfolder/{0}" HeaderText="Download" Text="Download" />
        </Columns>
    </asp:GridView>
</asp:Content>

