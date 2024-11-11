//封装存储数据的方法
import { AdvertClass } from '../models'
import { preferences } from '@kit.ArkData'


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
      name: "setting"
    })
  }

  //设置用户广告设置
  setUserAd(ad: AdvertClass) {
    //获取到了创建的仓库
    const store = this.getStore()
    //给仓库中存储数据
    store.putSync("setting_ad", JSON.stringify(ad))
    //将数据写入到磁盘
    store.flush()

  }

  //获取广告配置
  getUserAd(): AdvertClass {
    const store = this.getStore()
    return JSON.parse(store.getSync("setting_ad", JSON.stringify(defaultAd)) as string)
  }
}
