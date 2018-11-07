<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Creating external search form with the ASPxTextBox and highlighting found items</title>
</head>
<body>
    <script type="text/javascript">
        function onSearchClick(s, e) {
            ASPxDataView1.PerformCallback();
        }
    </script>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxTextBox ID="searchTextBox" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxButton ID="searchBtn" runat="server" Text="Search" AutoPostBack="false">
                            <ClientSideEvents Click="onSearchClick" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
            <dx:ASPxDataView ID="ASPxDataView1" runat="server" ClientInstanceName="ASPxDataView1" DataSourceID="Products" EnableViewState="false" OnCustomCallback="ASPxDataView1_CustomCallback" on>
                <ItemTemplate>
                    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="236px" BackColor='<%#SetPanelColor(Container.DataItem)%>' Height="76px">
                        <PanelCollection>
                            <dx:PanelContent>
                                ProductID:
                                <dx:ASPxLabel ID="labelProduct" runat="server" Text='<%#Eval("ProductID")%>' Font-Bold="true"></dx:ASPxLabel>
                                <br></br>
                                ProductName:
                                <dx:ASPxLabel ID="labelName" runat="server" Text='<%#Eval("ProductName")%>' Font-Bold="true"></dx:ASPxLabel>
                                <br></br>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </ItemTemplate>
            </dx:ASPxDataView>
        </div>
        <asp:AccessDataSource ID="Products" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [ProductID],[ProductName] FROM [Products]" />
    </form>
</body>
</html>