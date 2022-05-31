import react, { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { Provider as PaperProvider } from 'react-native-paper';
import AuthScreen from './src/screens/Auth';


export default function App() {
  const [auth, setAuth] = useState(false);

  return (
    <PaperProvider>
      <View style={styles.container}>
        {auth ? <Text>Zona de usuarios</Text> : <AuthScreen />}
      </View>

    </PaperProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
