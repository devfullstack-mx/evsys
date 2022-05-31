import React, { useState } from 'react'
import { View } from 'react-native'
import { TextInput, Button } from 'react-native-paper'

import { formStyles } from '../../styles'

export default function RegisterForm() {
    // const { changeForm } = props;
    const [loading, setloading] = useState(false);

    return (
        <View>
            <TextInput label='Email'
                style={formStyles.input}
            />
            <TextInput label='Nombre del Usuario'
                style={formStyles.input}
            />
            <TextInput label='Contraseña'
                style={formStyles.input}
                secureTextEntry
            />
            <TextInput label='Repetir contraseña'
                style={formStyles.input}
                secureTextEntry
            />

            <Button mode="contained" style={formStyles.btnSuccess}>Registrarse</Button>

            <Button mode="text" style={formStyles.btnText} labelStyle={formStyles.btnTextLabel}>Iniciar sesión</Button>

        </View >
    )


}