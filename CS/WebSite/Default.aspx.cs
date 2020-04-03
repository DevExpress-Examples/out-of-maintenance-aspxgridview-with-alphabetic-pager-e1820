using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    const string sessionKey = "CE6907BD-E867-4cbf-97E2-F1EB702F433";
    public string ActivePageSymbol {
        get {
            if (Session[sessionKey] == null)
                Session[sessionKey] = "A";
            return (string)Session[sessionKey];
        }
        set { Session[sessionKey] = value; }
    }
    protected void Page_Init(object sender, EventArgs e) {
        if (!IsPostBack) {
            grid.PageIndex = -1; // to show all visible records
        }
        RefreshGridViewPager();
    }
    private void RefreshGridViewPager() {
        grid.Templates.PagerBar = new MyPagerBarTemplate(ActivePageSymbol);
        grid.FilterExpression = string.Format("StartsWith([ProductName], '{0}')", ActivePageSymbol);
    }

    public class MyPagerBarTemplate : ITemplate {
        string activePageSymbol;

        public MyPagerBarTemplate(string activePageSymbol) {
            this.activePageSymbol = activePageSymbol;
        }

        public string ActivePageSymbol { get { return activePageSymbol; } }

        public void InstantiateIn(Control container) {
            List<string> alphabet = new List<string>(27);
            int startCharIndex = Convert.ToInt32('A');
            int endChartIndex = Convert.ToInt32('Z');
            for (int i = startCharIndex; i <= endChartIndex; i++)
                alphabet.Add(Convert.ToChar(i).ToString());

            WebControl div = new WebControl(HtmlTextWriterTag.Div);
            container.Controls.Add(div);
            div.Attributes["class"] = "container";


            foreach (string item in alphabet) {
                HtmlAnchor anchor = new HtmlAnchor();
                div.Controls.Add(anchor);

                anchor.HRef = string.Format("javascript:MoveToPage('{0}')", item);
                anchor.InnerText = item;
                anchor.Attributes["class"] = "anchor";
                if (item == ActivePageSymbol)
                    anchor.Attributes["class"] += " active";
            }
        }
    }

    protected void grid_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        ActivePageSymbol = e.Parameters;
        RefreshGridViewPager();
    }
}