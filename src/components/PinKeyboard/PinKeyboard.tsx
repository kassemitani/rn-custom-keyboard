import React, {useEffect} from 'react';
import {
  requireNativeComponent,
  NativeEventEmitter,
  NativeModules,
  Platform,
} from 'react-native';
import styles from './styles';

const CustomKeyboard = requireNativeComponent('CustomKeyboard');

const {RCTDeviceEventEmitter, CustomKeyboardEventEmitter} = NativeModules;

type PinKeybaordProps = {
  onKeyPress: (key: string) => void;
};

const PinKeybaord = ({onKeyPress}: PinKeybaordProps) => {
  useEffect(() => {
    let eventEmitter;

    if (Platform.OS === 'ios') {
      eventEmitter = new NativeEventEmitter(CustomKeyboardEventEmitter);
    } else {
      eventEmitter = new NativeEventEmitter(RCTDeviceEventEmitter);
    }
    const subscription = eventEmitter.addListener('onKeyPress', event => {
      onKeyPress(event.key);
    });

    return () => {
      subscription.remove();
    };
  }, [onKeyPress]);

  return (
    <CustomKeyboard
      style={styles.container}
      onKeyPress={e => console.log('onKeyPress', {e})}
      deleteIcon="delete"
    />
  );
};

export default PinKeybaord;
