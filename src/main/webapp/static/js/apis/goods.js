import request from '../utils/http.js'

// 假设你的接口地址是 http://example.com/category/1/0
export const getGoodsAPI = (cate, page) => {
    return request({
        url: `/category/${cate}/${page}`,
        method: 'GET'
    });
};
