//引入axios
import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';

//创建axios实例对象
const service = axios.create({
  baseURL: "BASE_URL",
  timeout: 1000
})

//创建请求拦截器

service.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  return config;
}, (error: AxiosError) => {
  return Promise.reject(error);
});

//创建响应拦截器
service.interceptors.response.use((response: AxiosResponse) => {
  return response;
}, (error: AxiosError) => {
  return Promise.reject(error);
});


//创建自定义的请求方法
export class Http {
  get<T>(url: string, params?: object) {
    return service.get <null, T>(url, { params })
  }

  post<T>(url: string, data?: object) {
    return service.post<null, T>(url, data)
  }

  put<T>(url: string, data?: object) {
    return service.put<null, T>(url, data)
  }

  delete<T>(url: string, data?: object) {
    return service.delete(url,)
  }
}


//
export { }