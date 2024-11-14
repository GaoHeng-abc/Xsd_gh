//封装存储数据的方法
import { AdvertClass } from '../models'
import { preferences } from '@kit.ArkData'
import { TOKEN_KEY, XSD_SETTING, XSD_SETTING_AD } from '../constants'


//封装存储数据的方法
export const defaultAd: AdvertClass = {
  //显示广告
  showAd: true,
  //广告时长
  adTime: 5,
  //广告图片
  adImage: $r('app.media.start')
}


export class UserSettingClass {
  context: Context

  //实例化UseSettingClass这个类进行触发
  constructor(context: Context) {
    //初始化上下文对象
    this.context = context
  }

  //获取存储用户信息的首选仓库
  getStore() {
    //创建仓库
    return preferences.getPreferencesSync(this.context, {
      name: XSD_SETTING
    })
  }

  //设置用户广告设置
  setUserAd(ad: AdvertClass) {
    //获取到了创建的仓库
    const store = this.getStore()
    //给仓库中存储数据
    store.putSync(XSD_SETTING_AD, JSON.stringify(ad))
    //将数据写入到磁盘
    store.flush()

  }

  //获取广告配置
  getUserAd(): AdvertClass {
    const store = this.getStore()
    return JSON.parse(store.getSync(XSD_SETTING_AD, JSON.stringify(defaultAd)) as string)
  }


  //存储token的数据
  setUserToken(token: string) {
    //获取仓库
    const store = this.getStore()
    store.putSync(TOKEN_KEY, token)
    //写入到磁盘
    store.flush()
  }

  //获取存储的token数据
  getUserToken(): string {
    //获取仓库
    const store = this.getStore()
    return store.getSync(TOKEN_KEY, "") as string
  }
}
