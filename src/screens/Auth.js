import React, { useState } from 'react';
import { StyleSheet, View, Text, Image, KeyboardAvoidingView } from 'react-native'
import RegisterForm from '../components/Auth/RegisterForm';
import logo from '../../assets/logo.png';

import { layoutStyle } from '../styles';
import { Platform } from 'react-native-web';

export default function Auth() {
    const [showLogin, setShowLogin] = useState(false);

    return (
        <View style={layoutStyle.container}>
            <Image style={styles.logo} source={logo} />
            <KeyboardAvoidingView behavior={Platform.OS === 'ios' ? "padding" : "height"}>
                {showLogin ? <Text>FormLogin</Text> : <RegisterForm />}
            </KeyboardAvoidingView>

        </View>
    )
}

const styles = StyleSheet.create({
    logo: {
        width: 350,
        height: 50,
        resizeMode: "contain",
        marginBottom: 20
    }
});
