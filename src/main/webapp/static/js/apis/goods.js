import request from '../utils/http.js'

// 假设你的接口地址是 http://example.com/category/1/0
export const getGoodsAPI = (cate, page) => {
    return request({
        url: `/goods/category/${cate}/${page}`,
        method: 'GET'
    });
};

// 添加商品到购物车 (不用添加商品个数，因为二手交易，平台上不设置商品个数的属性)
export const addGoodsToCartAPI = (goodsId) => {
    return request({
        url: `/cart/add`,
        method: 'POST',
        params: {
            goodsId
        }
    });
};
// 获取购物车列表
export const getCartAPI = () => {
    return request({
        url: `/cart`,
        method: 'GET'
    });
};

export const buyGoodsAPI = (goodsId) => {
    return request({
        url: `/order/add`,
        params: {
            goodsId
        }
    });
};
