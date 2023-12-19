import request from '../utils/http.js';

// 获取用户信息
export const getUserInfoAPI = (studentNo) => {
    return request({
        url: `/user/${studentNo}`, // Replace with your actual endpoint
        method: 'GET'
    });
};

// 更新用户信息
export const updateAPI = ({studentNo, name, phone, wechat, email}) => {
    return request({
        url: '/student',
        method: 'PUT',
        data: {
            studentNo,
            name,
            phone,
            wechat,
            email
        }
    })
}
