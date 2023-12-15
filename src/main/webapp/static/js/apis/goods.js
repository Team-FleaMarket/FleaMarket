import request from '../utils/http.js'

// 假设你的接口地址是 http://example.com/category/1/0
export const getGoodsAPI = (cate, page) => {
    return request({
        url: `/category/${cate}/${page}`,
        method: 'GET'
    });
};

// 添加商品到购物车 (不用添加商品个数，因为二手交易，平台上不设置商品个数的属性)
export const addGoodsToCartAPI = (goodsId, studentNo) => {
    return request({
        url: `/cart/add`,
        method: 'UPDATE',
        data: {
            goodsId,
            studentNo
        }
    });
};
// 获取购物车列表
export const getCartAPI = (studentNo) => {
    return request({
        url: `/cart/${studentNo}`,
        method: 'GET'
    });
};
