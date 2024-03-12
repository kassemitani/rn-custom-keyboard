import {View, Text} from 'react-native';
import React, {useState} from 'react';
import PinKeybaord from '../../components/PinKeyboard/PinKeyboard';
import styles from './styles';
import PinCodeDisplay from '@/components/PinCodeDisplay/PinCodeDisplay';
import PinButtons from '@/components/PinButtons/PinButtons';

const PinCode = () => {
  const [pin, setPin] = useState('');
  const [showPin, setShowPin] = useState(false);

  const toggleShowPin = () => {
    setShowPin(!showPin);
  };

  const resetPin = () => {
    setPin('');
  };

  const onKeyPress = (key: string) => {
    if (key === 'DELETE') {
      setPin(pin.slice(0, -1));
    } else {
      setPin(pin + key);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>PinCode</Text>
      <View style={styles.pinView}>
        <PinCodeDisplay pin={pin} showPin={showPin} pinLength={4} />
        <PinButtons
          showPin={showPin}
          toggleShowPin={toggleShowPin}
          resetPin={resetPin}
        />
      </View>
      <PinKeybaord onKeyPress={onKeyPress} />
    </View>
  );
};

export default PinCode;
