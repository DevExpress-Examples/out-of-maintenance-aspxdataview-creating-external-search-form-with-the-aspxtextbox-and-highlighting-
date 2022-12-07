using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        ASPxDataView1.DataBind();
    }
    bool IsSuitableItem(object dataItem) {
        string searchText = searchTextBox.Text.ToLower();
        if(dataItem != null && !string.IsNullOrEmpty(searchText)) {
            string valueText = DataBinder.Eval(dataItem, "ProductName").ToString().ToLower();
            return (valueText.Contains(searchText));
        }
        return false;
    }
    public Color SetPanelColor(object dataItem) {
        return (IsSuitableItem(dataItem)) ? Color.LightGreen : Color.Empty;
    }
    protected void ASPxDataView1_CustomCallback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
        List<DataRowView> selectResult = Products.Select(DataSourceSelectArguments.Empty).Cast<DataRowView>().ToList();
        for(int i = 0; i < selectResult.Count; i++) {
            if(IsSuitableItem(selectResult[i])) {
                ASPxDataView1.PageIndex = i / ASPxDataView1.PageCount;
                return;
            }
        }
    }
}
