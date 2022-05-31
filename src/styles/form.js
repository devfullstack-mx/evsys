import { StyleSheet } from "react-native";
import colors from "./colors"

const formStyles = StyleSheet.create({
    input: {
        margin: 12,
        width: 300,
        height: 50,
    },
    btnSuccess: {
        padding: 5,
        backgroundColor: colors.primary,
    },
    btnText: {
        marginTop: 5,
    },
    btnTextLabel: {
        color: colors.dark,
    }

})

export default formStyles;