import express from 'express';
import cors from 'cors';
import ErrorHandler from './utils/ErrorHandler.js';
import session from 'express-session';
import sessionConfig from './config/Session.js';
import helmet from 'helmet';
import { AdminRoute } from './routes/AdminRoute.js';
import redis from 'redis';

export default async (app) => {
    const redisClient = redis.createClient();
    redisClient.connect().catch((err) => console.log(err));

    app.use(express.json());
    app.use(express.urlencoded({ extended: true }));
    app.use(cors());
    app.use(helmet());
    redisClient.on('connect', () => {
        console.log('redis connected');
        app.use(session(sessionConfig(redisClient, session)));
    })


    // API Route
    app.use('/admin', AdminRoute);

    app.use(ErrorHandler);
}