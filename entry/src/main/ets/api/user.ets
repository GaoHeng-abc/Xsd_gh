import { Http } from 'basic'
import { AccountFormModel } from '../models'


export const loginApi = (data: AccountFormModel): Promise<string> => {
  return Http.post<string>("/login/account", data,)
}

//获取用户信息登录接口
