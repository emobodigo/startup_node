import dotenv from 'dotenv';
import path from 'path';
import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

if (process.env.NODE_ENV != 'prod') {
    const configFile = path.resolve(__dirname, `../../.env.dev`)
    dotenv.config({ path: configFile });
} else {
    dotenv.config();
}

const PORT = process.env.PORT
const IN_PROD = process.env.NODE_ENV === 'prod';
const SESSION_AGE = 12 * 60 * 60 * 1000;

export {
    PORT,
    IN_PROD,
    SESSION_AGE
}