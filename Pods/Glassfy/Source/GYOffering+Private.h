//
//  GYOffering+Private.h
//  Glassfy
//
//  Created by Luca Garbolino on 15/01/21.
//

#import "GYOffering.h"
#import "GYCodableProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYOffering (Private) <GYDecodeProtocol>
// @property(nonatomic, nullable, strong) NSString *name;
@property(nonatomic, strong) NSString *offeringId;
@property(nonatomic, strong) NSArray<GYSku*> *skus;
@end

NS_ASSUME_NONNULL_END
