import express from 'express';
import { PORT } from './config/index.js';
import expressApp from './app.js';
const startServer = async () => {
    const app = express();
    await expressApp(app);
    app.listen(PORT, () => {
        console.log(`Server is running on PORT ${PORT}`);
    }).on('error', (err) => {
        console.log(err);
        process.exit();
    })
}

startServer().catch((err) => console.log(err));