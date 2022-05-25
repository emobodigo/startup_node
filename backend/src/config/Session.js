import ConnectRedis from 'connect-redis';
import { IN_PROD, SESSION_AGE } from './index.js';

export default (redisClient, session) => {
    const RedisStore = ConnectRedis(session);
    const sessionStore = new RedisStore({ client: redisClient, ttl: 86400 })
    const sessionConfig = {
        name: process.env.SESS_NAME,
        resave: false,
        store: sessionStore,
        saveUninitialized: false,
        secret: process.env.SESS_SECRET,
        cookie: {
            maxAge: SESSION_AGE,
            sameSite: true,
            secure: IN_PROD
        },
    }
    redisClient.on('error', () => {
        console.log('Redis Service Unavailable');
    })

    return sessionConfig;
}

