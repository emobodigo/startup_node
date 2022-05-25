import * as winston from 'winston';
import { AppError } from './AppError.js';
import 'winston-daily-rotate-file';

const customFormat = winston.format.combine(
    winston.format.timestamp({ format: "DD-MMM-YYY HH:mm:ss" }),
    winston.format.align(),
    winston.format.printf((i) => `${i.level}: ${i.timestamp}: ${i.message}`)
);

const LogError = winston.createLogger({
    format: customFormat,
    transports: [
        new winston.transports.DailyRotateFile({
            filename: 'logs/app-%DATE%.log',
            datePattern: 'YYYY-MM-DD',
            zippedArchive: true,
            maxSize: "20m",
            maxFile: "14d",
            level: "error"
        }),
        new winston.transports.Console()
    ]
})

const isOperationalError = (error) => {
    if (error instanceof AppError) {
        return error.isOperational;
    } else {
        return false;
    }
}



const ErrorHandler = async (err, req, res, next) => {

    process.on('uncaughtException', (err) => {
        LogError.error(err);
        if (!isOperationalError(err)) {
            process.exit(0);
        }
    })

    process.on('unhandledRejection', (err) => {
        LogError.error(err);
        if (!isOperationalError(err)) {
            process.exit(0);
        }
    })

    if (err) {
        LogError.error(err);
        if (isOperationalError(err)) {
            return res.status(err.statusCode).json({ 'status': err.statusCode, 'message': err.name, 'description': err.message })
        } else {
            process.exit(0)
        }
    }
    next();
}

export default ErrorHandler;