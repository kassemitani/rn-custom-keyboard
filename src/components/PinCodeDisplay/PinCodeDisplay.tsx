import {View, Text} from 'react-native';
import React from 'react';
import styles from './styles';

type PinCodeViewProps = {
  pin: string;
  showPin: boolean;
  pinLength: number;
};

const PinCodeDisplay = ({pin, showPin, pinLength}: PinCodeViewProps) => {
  const renderPinChar = (index: number) => {
    if (index < pin.length) {
      return showPin ? pin[index] : '*';
    }
    return 'o';
  };

  return (
    <View style={styles.pinDisplay}>
      {Array.from({length: pinLength}).map((_, index) => (
        <Text key={index} style={styles.pinSymbol}>
          {renderPinChar(index)}
        </Text>
      ))}
    </View>
  );
};

export default PinCodeDisplay;
