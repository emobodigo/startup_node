const STATUS_CODE = {
    OK: 200,
    BAD_REQUEST: 400,
    UNAUTHORIZED: 403,
    NOT_FOUND: 404,
    INTERNAL_ERROR: 500
}

class AppError extends Error {
    constructor(name, statusCode, description, isOperational) {
        super(description);
        Object.setPrototypeOf(this, new.target.prototype);
        this.name = name;
        this.statusCode = statusCode;
        this.isOperational = isOperational;
        Error.captureStackTrace(this);
    }
}

class APIError extends AppError {
    constructor(name, statusCode = STATUS_CODE.NOT_FOUND, description = 'Not found.', isOperational = true) {
        super(name, statusCode, description, isOperational);
    }
}

class InternalError extends AppError {
    constructor(name, description = 'Internal Server Error', isOperational = true) {
        super(name, STATUS_CODE.INTERNAL_ERROR, description, isOperational);
    }
}

class BadRequestError extends AppError {
    constructor(description = 'Bad Request') {
        super('BAD REQUEST', STATUS_CODE.BAD_REQUEST, description, true)
    }
}

class ValidationError extends AppError {
    constructor(description = 'Validation Error') {
        super('VALIDATION ERROR', STATUS_CODE.BAD_REQUEST, description, true)
    }
}

class UnauthorizedError extends AppError {
    constructor(description = 'Unauthorized') {
        super('UNAUTHORIZED ERROR', STATUS_CODE.UNAUTHORIZED, description, true);
    }
}

export {
    STATUS_CODE,
    BadRequestError,
    ValidationError,
    AppError,
    APIError,
    InternalError,
    UnauthorizedError
}