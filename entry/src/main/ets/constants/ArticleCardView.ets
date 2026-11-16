import { LearningResource } from "../model/LearningResource"

@Component
export struct ArticleCardView {
  @Prop articleItem: LearningResource = new LearningResource();
  @Prop isCollected: boolean = false;
  @Prop isLiked: boolean = false;

  build() {
    Row({ space: 16 }) {
      Column() {
        Column() {
          Text(this.articleItem.title)
            .fontSize($r('app.float.md_font_size'))
            .fontFamily('HarmonyHeiTi')
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .opacity(0.9)
            .maxLines(2)
            .margin({ bottom: $r('app.float.xs_padding_margin') })

          Text(this.articleItem.brief)
            .fontSize($r('app.float.sm_font_size'))
            .fontFamily('HarmonyHeiTi')
            .opacity(0.6)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .textAlign(TextAlign.Start)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Row() {
          ActionButtonBuilder(
            $r('app.media.ic_eye_open'),
            this.articleItem.viewsCount,
            $r('app.float.view_count_icon_width')
          )

          ActionButtonBuilder(
            this.isLiked? $r('app.media.btn_good_on') : $r('app.media.btn_good_normal'),
            this.articleItem.likesCount,
            $r('app.float.like_icon_width')
          )

          ActionButtonBuilder(
            this.isCollected? $r('app.media.btn_favorites_on') : $r('app.media.btn_favorites_normal'),
            this.articleItem.collectionCount,
            $r('app.float.star_icon_width')
          )
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .layoutWeight(1)
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Image(this.articleItem.headerImageUrl)
        .interpolation(ImageInterpolation.High)
        .height($r('app.float.article_card_image_height'))
        .width($r('app.float.article_card_image_width'))
        .borderRadius($r('app.float.md_border_radius'))
        .alt($r('app.media.img_placeholder'))
        .objectFit(ImageFit.Cover)
    }
    .padding($r('app.float.md_padding_margin'))
    .borderRadius($r('app.float.lg_border_radius'))
    .backgroundColor(Color.White)
    .alignItems(VerticalAlign.Top)
    .width('100%')
    .height($r('app.float.article_card_image_height'))
  }
}

@Builder
function ActionButtonBuilder(imgResource: Resource, count: number, textWidth: Resource) {
  Row() {
    Image(imgResource)
      .size({ width: 16, height: 16 })
      .margin({ right: $r('app.float.action_button_margin_right') })
    Text(count.toString())
      .fontFamily('HarmonyHeiTi')
      .fontSize($r('app.float.small_text_size'))
      .width(textWidth)
      .opacity(0.6)
  }
  .width($r('app.float.action_button_width'))
  .padding({ top: $r('app.float.small_padding') })
  .alignItems(VerticalAlign.Center)
  .justifyContent(FlexAlign.Center)
}
