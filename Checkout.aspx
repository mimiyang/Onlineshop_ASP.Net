﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT OrderID, OrderLine.SongID, Quantity, Title, Album, Artist,
  FileName, ListPrice as Price, (ListPrice * Quantity) as SubTotal
FROM OrderLine JOIN Song ON OrderLine.SongID = Song.SongID 
WHERE (OrderID = @OrderID)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderID" SessionField="orderID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" 
                SortExpression="OrderID" />
            <asp:BoundField DataField="SongID" HeaderText="SongID" ReadOnly="True" 
                SortExpression="SongID" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Album" HeaderText="Album" SortExpression="Album" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" 
                SortExpression="Artist" />
            <asp:BoundField DataField="FileName" HeaderText="FileName" 
                SortExpression="FileName" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" 
                SortExpression="SubTotal" />
        </Columns>
    </asp:GridView>
</asp:Content>

