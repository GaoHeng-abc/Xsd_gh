import { AdvertClass, UserSettingClass } from 'basic'
import { window } from '@kit.ArkUI'

@Entry
@Component
struct Start {
  @State
  adObj: AdvertClass = {} as AdvertClass
  @State
  timer: number = -1

  //页面开始加载的时候触发当前生命周期方法
  aboutToAppear(): void {
    //获取到本地的广告配置
    const setting = new UserSettingClass(getContext())
    this.adObj = setting.getUserAd()

    //调用倒计时方法
    this.CountDown()
  }

  //销毁子窗口的方法
  closeWin() {
    //1.查找到销毁的窗口
    //2.进行销毁
    window.findWindow("ad_window").destroyWindow()
  }

  //倒计时的方法
  CountDown() {
    //开启定时器
    this.timer = setInterval(() => {
      //当倒计时为0的时候 停止倒计时
      if (this.adObj.adTime === 0) {
        //清除定时器
        clearInterval(this.timer)
        //销毁子窗口
        this.closeWin()
        //阻止代码往下执行
        return
      }
      //倒计时减减
      this.adObj.adTime--
    }, 1000)
  }

  //当前页面销毁的时候 一定要清除定时器 如果不清除内存会泄露
  aboutToDisappear(): void {
    //清除定时器
    clearInterval(this.timer)
  }

  build() {
    RelativeContainer() {
      Stack({ alignContent: Alignment.TopEnd }) {
        Image(this.adObj.adImage)
          .objectFit(ImageFit.Cover)

        Text(this.adObj.adTime == 0 ? "跳过" : this.adObj.adTime + "秒后跳过")
          .padding({ left: 10, right: 10 })
          .height(30)
          .margin({ right: 20, top: 40 })
          .fontSize(14)
          .borderRadius(15)
          .textAlign(TextAlign.Center)
          .backgroundColor($r("app.color.background_page"))
          .onClick(() => {
            this.closeWin()
          })
      }
      .height("100%")
      .width("100%")
    }
  }
}