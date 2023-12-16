import request from '../utils/http.js'

export const loginAPI = ({studentNo, password}) => {
    return request({
        url: '/student/login',
        method: 'POST',
        data: {
            studentNo,
            password,
        }
    })
}

export const registerAPI = ({studentNo, name, phone, wechat, email, password}) => {
    return request({
        url: '/student/register',
        method: 'POST',
        data: {
            studentNo,
            name,
            phone,
            wechat,
            email,
            password
        }
    })
}

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