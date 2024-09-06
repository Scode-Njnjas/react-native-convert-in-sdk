import { useContext } from 'react';
import { RNConvertInSDK } from '../context/RNConvertedInSdkProvider';

export const useConvertedInSdk = () => {
  const context = useContext(RNConvertInSDK);

  if (!context) {
    throw new Error(
      'useConvertedInSdk must be used within a ConvertedInProvider'
    );
  }

  return {
    isInitialized: context.isInitialized,
    initializeSDK: context.initializeSDK,
    identifyUser: context.identifyUser,
    addEvent: context.addEvent,
    viewContentEvent: context.viewContentEvent,
    addToCartEvent: context.addToCartEvent,
    initiateCheckoutEvent: context.initiateCheckoutEvent,
    purchaseEvent: context.purchaseEvent,
    registerEvent: context.registerEvent,
  };
};
