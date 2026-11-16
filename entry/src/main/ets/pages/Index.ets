import { ForEachListPage } from "./ForEachListPage";
// import { LazyForEachListPage } from './LazyForEachListPage'

@Entry
@Component
struct Index {
  @Provide('NavPathStack') pageStack: NavPathStack = new NavPathStack()

  testLog(message: string) {
    // console.log(message, arguments)
  }

  @Builder
  PagesMap(name: string, param: object) {
    NavDestination() {
      if (name === 'ForEachListPage') {
        ForEachListPage()
      
      } else if (name === 'LazyForEachListPage') {
        // LazyForEachListPage()
      }
    }
    .hideTitleBar(true)
  }

  build() {
    Navigation(this.pageStack) {
      Row() {
        Column() {
          Button('ForEach')
            .width(200)
            .margin(10)
            .onClick(() => {
              this.pageStack.pushPathByName('ForEachListPage', '')
            })
          Button('LazyForEach')
            .width(200)
            .margin(10)
            .onClick(() => {
              this.pageStack.pushPathByName('LazyForEachListPage', '')
            })
        }
        .width('100%')
        // .backgroundColor(Color.Green)

      }
      .height('100%')
      // .backgroundColor(Color.Red)
    }
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
    .navDestination(this.PagesMap)
  }
}

