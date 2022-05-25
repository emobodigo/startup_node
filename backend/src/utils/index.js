import bcrypt from 'bcrypt';
import moment from 'moment-timezone';

export const generateSalt = async () => {
    return await bcrypt.genSalt();
}

export const generatePassword = async (password, salt) => {
    return await bcrypt.hash(password, salt)
}

export const validatePassword = async (enteredPassword, savedPassword, salt) => {
    return await this.generatePassword(enteredPassword, salt) === savedPassword;
}

export const FormatResponse = (data, status = 200) => {
    if (data) {
        return { status, data }
    } else {
        throw new Error('Data not found');
    }
}

export const getCurrentDateTime = () => {
    const timezone = moment().tz('Asia/Jakarta');
    const currentDateTime = timezone.format('YYYY-MM-DD HH:mm:ss');
    return currentDateTime;
}