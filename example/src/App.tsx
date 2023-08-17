import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import {
  multiply,
  RNTransferIOSWithCallBack,
  RNTransferDistance,
} from 'react-native-common-utils';

export default function App() {
  const [result, setResult] = React.useState<number | undefined>();

  React.useEffect(() => {
    multiply(3, 7).then(setResult);
    RNTransferDistance(
      {
        latitude: '1',
        longitude: '1',
        Anolatitude: '2',
        Anolongitude: '2',
      },
      (data) => {
        console.log(data);
      }
    );
    RNTransferIOSWithCallBack((data) => {
      console.log(data);
    });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Result: {result}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
