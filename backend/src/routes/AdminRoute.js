import express from 'express';
import { testGetData } from '../controllers/AdminController.js'

const router = express.Router();

router.get('/', testGetData)

export { router as AdminRoute }