package cn.edu.nwpu.fleamarket.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName orders
 */
public class Orders implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 
     */
    private Integer sellerId;

    /**
     * 
     */
    private Integer buyerId;

    /**
     * 
     */
    private Integer goodsId;

    /**
     * 
     */
    private Integer sellerConfirm;

    /**
     * 
     */
    private Integer buyerConfirm;

    /**
     * 
     */
    private Integer buyerCancel;

    /**
     * 
     */
    private Integer sellerCancel;

    /**
     * 
     */
    private Integer isDelete;

    /**
     * 
     */
    private Date orderTime;

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public Integer getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 
     */
    public Integer getSellerId() {
        return sellerId;
    }

    /**
     * 
     */
    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    /**
     * 
     */
    public Integer getBuyerId() {
        return buyerId;
    }

    /**
     * 
     */
    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    /**
     * 
     */
    public Integer getGoodsId() {
        return goodsId;
    }

    /**
     * 
     */
    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 
     */
    public Integer getSellerConfirm() {
        return sellerConfirm;
    }

    /**
     * 
     */
    public void setSellerConfirm(Integer sellerConfirm) {
        this.sellerConfirm = sellerConfirm;
    }

    /**
     * 
     */
    public Integer getBuyerConfirm() {
        return buyerConfirm;
    }

    /**
     * 
     */
    public void setBuyerConfirm(Integer buyerConfirm) {
        this.buyerConfirm = buyerConfirm;
    }

    /**
     * 
     */
    public Integer getBuyerCancel() {
        return buyerCancel;
    }

    /**
     * 
     */
    public void setBuyerCancel(Integer buyerCancel) {
        this.buyerCancel = buyerCancel;
    }

    /**
     * 
     */
    public Integer getSellerCancel() {
        return sellerCancel;
    }

    /**
     * 
     */
    public void setSellerCancel(Integer sellerCancel) {
        this.sellerCancel = sellerCancel;
    }

    /**
     * 
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 
     */
    public Date getOrderTime() {
        return orderTime;
    }

    /**
     * 
     */
    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

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
            && (this.getSellerConfirm() == null ? other.getSellerConfirm() == null : this.getSellerConfirm().equals(other.getSellerConfirm()))
            && (this.getBuyerConfirm() == null ? other.getBuyerConfirm() == null : this.getBuyerConfirm().equals(other.getBuyerConfirm()))
            && (this.getBuyerCancel() == null ? other.getBuyerCancel() == null : this.getBuyerCancel().equals(other.getBuyerCancel()))
            && (this.getSellerCancel() == null ? other.getSellerCancel() == null : this.getSellerCancel().equals(other.getSellerCancel()))
            && (this.getIsDelete() == null ? other.getIsDelete() == null : this.getIsDelete().equals(other.getIsDelete()))
            && (this.getOrderTime() == null ? other.getOrderTime() == null : this.getOrderTime().equals(other.getOrderTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getSellerId() == null) ? 0 : getSellerId().hashCode());
        result = prime * result + ((getBuyerId() == null) ? 0 : getBuyerId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getSellerConfirm() == null) ? 0 : getSellerConfirm().hashCode());
        result = prime * result + ((getBuyerConfirm() == null) ? 0 : getBuyerConfirm().hashCode());
        result = prime * result + ((getBuyerCancel() == null) ? 0 : getBuyerCancel().hashCode());
        result = prime * result + ((getSellerCancel() == null) ? 0 : getSellerCancel().hashCode());
        result = prime * result + ((getIsDelete() == null) ? 0 : getIsDelete().hashCode());
        result = prime * result + ((getOrderTime() == null) ? 0 : getOrderTime().hashCode());
        return result;
    }

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
        sb.append(", sellerConfirm=").append(sellerConfirm);
        sb.append(", buyerConfirm=").append(buyerConfirm);
        sb.append(", buyerCancel=").append(buyerCancel);
        sb.append(", sellerCancel=").append(sellerCancel);
        sb.append(", isDelete=").append(isDelete);
        sb.append(", orderTime=").append(orderTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}