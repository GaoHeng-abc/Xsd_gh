import { AdvertClass } from 'basic'

@Entry
@Component
struct Start {
  @State
  abObj: AdvertClass = {
    showAd: false,
    adTime: 5,
    adUrl: "",
    adImg: $r("app.media.start")
  }
  @State
  timer: number = -1

  //页面开始加载的时候触发当前生命周期方法
  aboutToAppear(): void {
    //调用倒计时方法
    this.CountDown()
  }

  //倒计时的方法
  CountDown() {
    this.timer = setInterval(() => {
      if (this.abObj.adTime === 0) {
        clearInterval(this.timer)
        return
      }
      this.abObj.adTime--
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
        Image($r("app.media.start"))
          .objectFit(ImageFit.Cover)

        Text(this.abObj.adTime + "秒后跳过")
          .padding({ left: 10, right: 10 })
          .height(30)
          .margin({ right: 20, top: 20 })
          .fontSize(14)
          .borderRadius(15)
          .textAlign(TextAlign.Center)
          .backgroundColor($r("app.color.background_page"))
      }
      .height("100%")
      .width("100%")
    }
  }
}