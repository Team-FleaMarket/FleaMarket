// 创建axios实例
const httpInstance = axios.create({
    baseURL: 'http://localhost:8080', // 测试用
    timeout: 5000
})

export default httpInstance