import { AccountFormModel } from '../../models'
import { JSON } from '@kit.ArkTS'

@Entry
@Component
struct Login {
  @State
  accountForm: AccountFormModel = {
    account: "",
    password: ""
  }

  //账号和密码空状态处理
  getFormValidate() {
    //如果账号和密码都不为空 则返回true
    if (this.accountForm) {
      return true
    }
    //如果为空 则返回 false
    return false
  }

  //登录方法
  submitLogin() {
    AlertDialog.show({
      message: JSON.stringify(this.accountForm)
    })
  }

  @Styles
  loginStyle(){
    .backgroundColor("#fff")
    .height(58)
    .border({
      width: {
        bottom: 1
      },
      color: $r("app.color.background_divider")
    })
    .borderRadius(0)
  }

  build() {
    Column() {
      //顶部标题
      Text("小时达")
        .fontSize(18)
        .height(28)
        .fontColor($r("app.color.text_primary"))
        .fontWeight(FontWeight.Bold)
      //账号登录标题
      Row() {
        Text("账号登录")
          .fontSize(24)
          .fontWeight(600)
        Row() {
          Text("手机号登录")
            .fontSize(16)
            .fontColor($r("app.color.primary"))
            .fontWeight(600)
          Image($r('app.media.ic_angle'))
            .width(10)
            .height(10)
            .margin({ left: 5 })
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ top: 50, bottom: 50 })

      //账号输入框
      TextInput({ placeholder: "请输入账号", text: $$this.accountForm.account })
        .loginStyle()

      //密码输入框
      TextInput({ placeholder: "请输入密码", text: $$this.accountForm.password })
        .type(InputType.Password)
        .loginStyle()
      //登录按钮
      Button({ type: ButtonType.Capsule }) {
        Text("登录")
          .fontColor($r("app.color.white"))

      }
      .width('100%')
      .height(50)
      .backgroundColor(this.getFormValidate() ? $r('app.color.primary') : $r('app.color.primary_disabled'))
      .margin({
        top: 50
      })
      .enabled(this.getFormValidate())
      .onClick(() => {
        this.submitLogin()
      })

    }
    .width('100%')
    .padding({ left: 32, right: 32 })
    .margin({ top: 40 })

  }
}