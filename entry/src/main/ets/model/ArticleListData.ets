import { LearningResource } from './LearningResource';
import { IDataSourcePrefetching } from '@kit.ArkUI';

export default class ArticleListData implements IDataSource, IDataSourcePrefetching {
  private dataArray: LearningResource[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(dataArray: LearningResource[]) {
    this.dataArray = dataArray;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number) {
    return this.dataArray[index];
  }

  public addData(index: number, data: LearningResource): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index)
  }

  public pushData(data: LearningResource): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1)
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  prefetch(index: number): void | Promise<void> {
    throw new Error('Method not implemented.');
  }

  cancel?(index: number): void | Promise<void> {
    throw new Error('Method not implemented.');
  }
}