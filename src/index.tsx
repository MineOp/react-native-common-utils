import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-common-utils' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const CommonUtils = NativeModules.CommonUtils
  ? NativeModules.CommonUtils
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return CommonUtils.multiply(a, b);
}
export function RNTransferIOSWithCallBack(callback: (arg0: any) => void) {
  return CommonUtils.RNTransferIOSWithCallBack((data: any) => {
    callback(data);
  });
}
export function RNTransferDistance(option: any, callback: (arg0: any) => void) {
  return CommonUtils.RNTransferDistance(option, (data: any) => {
    callback(data);
  });
}
export function jumpSystem(option: any, callback: (arg0: any) => void) {
  return CommonUtils.jumpSystem(option, (data: any) => {
    callback(data);
  });
}
