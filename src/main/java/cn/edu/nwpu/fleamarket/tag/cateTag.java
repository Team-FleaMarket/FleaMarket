package cn.edu.nwpu.fleamarket.tag;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * cate 标签
 * 根据cate的数值返回对应的类别
 *
 * @author lsy
 * @date 2023/12/15
 */
public class cateTag extends SimpleTagSupport {
    /**
     * 类别
     */
    private String category;

    /**
     * 设置类别
     *
     * @param category 类别
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * 标签
     *
     * @throws JspException JSP 异常
     * @throws IOException  ioexception
     */
    @Override
    public void doTag() throws JspException, IOException {
        if (category != null) {
            switch (category) {
                case "1":
                    getJspContext().getOut().write("<p>教材</p>");
                    break;
                case "2":
                    getJspContext().getOut().write("<p>考试</p>");
                    break;
                case "3":
                    getJspContext().getOut().write("<p>文学</p>");
                    break;
                case "4":
                    getJspContext().getOut().write("<p>运动</p>");
                    break;
                case "5":
                    getJspContext().getOut().write("<p>文具</p>");
                    break;
                case "6":
                    getJspContext().getOut().write("<p>生活</p>");
                    break;
                case "7":
                    getJspContext().getOut().write("<p>美妆</p>");
                    break;
                case "8":
                    getJspContext().getOut().write("<p>电子产品</p>");
                    break;
                default:
                    getJspContext().getOut().write("<p>未知分类</p>");
            }
        }
    }
}
