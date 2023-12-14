package cn.edu.nwpu.fleamarket.tag;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class PaginationTag extends SimpleTagSupport {

    private String status;
    private int currentPage;
    private int totalPage;

    public void setStatus(String status) {
        this.status = status;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public void doTag() throws JspException, IOException {

        getJspContext().getOut().print("<div class=\"pagination-tag\">");
        getJspContext().getOut().print("<a href=\"" +"/views/managecenter" + "?status=" + status + "&currentPage=" + (currentPage - 1) + "\">上一页</a>");
        getJspContext().getOut().print("<a id=\"currentPage\">第" + (currentPage + 1) + "页</a>");
        getJspContext().getOut().print("<a href=\"" + "/views/managecenter" + "?status=" + status + "&currentPage=" + (currentPage + 1) + "\">下一页</a>");
        getJspContext().getOut().print("<a id=\"totalpage\">共" + (totalPage ) + "页</a>");
        getJspContext().getOut().print("</div>");
        System.out.println("zheshitag");
    }
}
