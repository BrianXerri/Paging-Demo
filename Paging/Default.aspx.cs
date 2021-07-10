using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Paging
{
    public partial class Default : System.Web.UI.Page
    {
        protected Dictionary<string, int> PagingRange { get; set; }
        protected int CurrentPage;
        protected int PageCount;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse(Request.QueryString["page"], out CurrentPage);
            CurrentPage = CurrentPage < 1 ? 1 : CurrentPage;
            PageCount = 100;

            PagingRange = GetPagingRange(CurrentPage, PageCount, 5);
        }

        public static Dictionary<string, int> GetPagingRange(int currentPage, int pageCount, int pagingLimit)
        {
            int pagingStart;
            int pagingEnd;
            var pagingRange = new Dictionary<string, int>();

            if (pageCount >= pagingLimit)
            {
                if (currentPage <= (pagingLimit / 2))
                {
                    pagingStart = 1;
                    pagingEnd = pagingLimit;
                }
                else if (currentPage > pageCount - (pagingLimit / 2))
                {
                    pagingStart = pageCount - (pagingLimit - 1);
                    pagingEnd = pageCount;
                }
                else
                {
                    pagingStart = currentPage - (pagingLimit / 2);
                    pagingEnd = pagingStart + (pagingLimit - 1);
                }
            }
            else
            {
                pagingStart = 1;
                pagingEnd = pageCount;
            }

            pagingRange.Add("PagingStart", pagingStart);
            pagingRange.Add("PagingEnd", pagingEnd);

            return pagingRange;
        }
    }
}