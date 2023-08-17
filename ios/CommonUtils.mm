#import "CommonUtils.h"
#import <CoreLocation/CoreLocation.h>
#import <MAMapKit/MAMapKit.h>
@implementation CommonUtils
RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_EXPORT_METHOD(multiply:(double)a
                  b:(double)b
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    NSNumber *result = @(a * b);
    
    resolve(result);
}
RCT_EXPORT_METHOD(RNTransferIOSWithCallBack:(RCTResponseSenderBlock)callback) {
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)) {
        
        //定位功能可用
        callback(@[@"true"]);
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        
        //定位不能用
        callback(@[@"false"]);
        
    }
    
}
RCT_EXPORT_METHOD(RNTransferDistance:(NSDictionary *)options :(RCTResponseSenderBlock)callback) {
    //1.将两个经纬度点转成投影点
    MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake([options[@"latitude"] doubleValue] ,[options[@"longitude"] doubleValue]));
    MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake([options[@"Anolatitude"] doubleValue] ,[options[@"Anolongitude"] doubleValue]));
    //2.计算距离
    CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
    //    float distances = dobul;
    //    double dis = distance;
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithDouble:distance]];
    //  resolve(@{@"distance":[NSNumber numberWithDouble:distance]});
    callback(array);
    
}
@end
