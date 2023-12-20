package cn.edu.nwpu.fleamarket.pojo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单
 *
 * @author lsy
 * @TableName orders
 * @date 2023/12/15
 */
@NoArgsConstructor
@Getter
@Setter
public class Orders implements Serializable {
    /**
     * 编号
     */
    private Integer id;

    /**
     * 卖家 ID
     */
    private Integer sellerId;

    /**
     * 买家 ID
     */
    private Integer buyerId;

    /**
     * 商品编号
     */
    private Integer goodsId;

    /**
     * 卖家确认
     */
    private Integer sellerConfirm;

    /**
     * 买家确认
     */
    private Integer buyerConfirm;


    /**
     * 是否cancel
     */
    private Integer isCancel;

    /**
     * 是否删除
     */
    private Integer isDelete;

    /**
     * 订购时间
     */
    private Date orderTime;

    /**
     * UID
     */
    private static final long serialVersionUID = 1L;

    /**
     * 获取 ID
     *
     * @return {@link Integer}
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置 ID
     *
     * @param id 编号
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取卖家 ID
     *
     * @return {@link Integer}
     */
    public Integer getSellerId() {
        return sellerId;
    }

    /**
     * 设置卖家 ID
     *
     * @param sellerId 卖家 ID
     */
    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    /**
     * 获取买家 ID
     *
     * @return {@link Integer}
     */
    public Integer getBuyerId() {
        return buyerId;
    }

    /**
     * 设置买家 ID
     *
     * @param buyerId 买家 ID
     */
    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    /**
     * 获取商品 ID
     *
     * @return {@link Integer}
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * 设置货物 ID
     *
     * @param goodsId 商品编号
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }


    /**
     * get 是删除
     *
     * @return {@link Integer}
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 设置是否delete
     *
     * @param isDelete 是否删除
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 获取订单时间
     *
     * @return {@link Date}
     */
    public Date getOrderTime() {
        return orderTime;
    }

    /**
     * 设置订单时间
     *
     * @param orderTime 订购时间
     */
    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    /**
     *判断是否相等
     *
     * @return boolean
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Orders other = (Orders) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getSellerId() == null ? other.getSellerId() == null : this.getSellerId().equals(other.getSellerId()))
            && (this.getBuyerId() == null ? other.getBuyerId() == null : this.getBuyerId().equals(other.getBuyerId()))
            && (this.getGoodsId() == null ? other.getGoodsId() == null : this.getGoodsId().equals(other.getGoodsId()))

            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getOrderTime() == null ? other.getOrderTime() == null : this.getOrderTime().equals(other.getOrderTime()));
    }

    /**
     * 哈希码
     *
     * @return int
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getSellerId() == null) ? 0 : getSellerId().hashCode());
        result = prime * result + ((getBuyerId() == null) ? 0 : getBuyerId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getOrderTime() == null) ? 0 : getOrderTime().hashCode());
        return result;
    }

    /**
     *字符串
     *
     * @return {@link String}
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sellerId=").append(sellerId);
        sb.append(", buyerId=").append(buyerId);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", isCancel=").append(isCancel);
        sb.append(", buyerConfirm=").append(buyerConfirm);
        sb.append(", sellerConfirm=").append(sellerConfirm);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", orderTime=").append(orderTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}