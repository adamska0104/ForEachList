import { util } from '@kit.ArkTS';

export class LearningResource {
  uuid: string = '';
  id: string = '';
  title: string = '';
  brief?: string = '';
  type: string = 'feed';
  webUrl: string = ''
  publishDate: Date = new Date();
  headerImageUrl: string = '';
  topics: string[] = [];
  viewsCount: number = 0;
  collectionCount: number = 0;
  likesCount: number = 0;
  tag: string = 'normal';
  isLiked: boolean = false;
  isCollected: boolean = false;
  isViewed: boolean = false;
  mediaSrc: string = '';
  bannerSrc: string = '';

  constructor(resource?: LearningResource) {
    this.uuid = util.generateRandomUUID(false)
    if (resource !== undefined) {
      this.id = resource.id;
      this.title = resource.title;
      this.type = resource.type;
      this.tag = resource.tag;
      this.brief = resource.brief;
      this.webUrl = resource.webUrl;
      this.publishDate = resource.publishDate;
      this.headerImageUrl = resource.headerImageUrl;
      this.bannerSrc = resource.bannerSrc;
      this.mediaSrc = resource.mediaSrc;
      this.topics = resource.topics;
      this.viewsCount = resource.viewsCount;
      this.collectionCount = resource.collectionCount;
      this.likesCount = resource.likesCount;
      this.isLiked = resource.isLiked;
      this.isCollected = resource.isCollected;
      this.isViewed = resource.isViewed;
    }
  }

}