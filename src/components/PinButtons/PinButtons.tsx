import {Text, TouchableOpacity, View} from 'react-native';
import React from 'react';
import styles from './styles';

type PinButtonsProps = {
  showPin: boolean;
  toggleShowPin: () => void;
  resetPin: () => void;
};

const PinButtons = ({showPin, toggleShowPin, resetPin}: PinButtonsProps) => {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.button} onPress={toggleShowPin}>
        <Text>{showPin ? 'HIDE' : 'SHOW'}</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={resetPin}>
        <Text>RESET</Text>
      </TouchableOpacity>
    </View>
  );
};

export default PinButtons;
