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

// 导出 updateAPI 函数
// export function updateAPI(studentInfo) {
//     return fetch('/student', {
//         method: 'PUT',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: JSON.stringify(studentInfo),
//     })
//         .then(response => response.text())
//         .then(data => {
//             if (data === "ok") {
//                 console.log('更新成功');
//                 return true; // 表示更新成功
//             } else {
//                 console.error('更新失败');
//                 return false; // 表示更新失败
//             }
//         })
//         .catch(error => {
//             console.error('更新失败', error);
//             return false; // 表示更新失败
//         });
// }
