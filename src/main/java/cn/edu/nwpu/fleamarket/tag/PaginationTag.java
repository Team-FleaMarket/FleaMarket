package cn.edu.nwpu.fleamarket.tag;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * 分页标签
 *
 * @author lsy
 * @date 2023/12/15
 */
public class PaginationTag extends SimpleTagSupport {

    /**
     * 当前状态
     * 0 待审核
     * 1 带出售
     * -1审核未通过
     */
    private String status;
    /**
     * 当前页面
     */
    private int currentPage;
    /**
     * 总页数
     */
    private int totalPage;
    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 设置状态
     *
     * @param status 地位
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 设置当前页面
     *
     * @param currentPage 当前页面
     */
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * 设置总页数
     *
     * @param totalPage 总页数
     */
    public void setTotalPage(int totalPage) {
        if(totalPage==0)
        {
            totalPage=1;
        }
        this.totalPage = totalPage;
    }

    /**
     * 设置商品名称
     *
     * @param goodsName 商品名称
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * 标签
     *
     * @throws JspException JSP 异常
     * @throws IOException  ioexception
     */
    @Override
    public void doTag() throws JspException, IOException {

        getJspContext().getOut().print("<div class=\"pagination-tag\">");
        getJspContext().getOut().print("<a href=\"" +"/views/managecenter" + "?status=" + status + "&currentPage=" + (currentPage - 1) + "&searchInput="+goodsName+ "\">上一页</a>");
        getJspContext().getOut().print("<a id=\"currentPage\">第" + (currentPage + 1) + "页</a>");
        getJspContext().getOut().print("<a href=\"" + "/views/managecenter" + "?status=" + status + "&currentPage=" + (currentPage + 1) +"&searchInput="+goodsName+"\">下一页</a>");
        getJspContext().getOut().print("<a id=\"totalpage\">共" + (totalPage ) + "页</a>");
        getJspContext().getOut().print("</div>");
        System.out.println("zheshitag");
    }
}
