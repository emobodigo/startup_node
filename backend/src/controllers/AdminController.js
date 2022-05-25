import AdminService from "../services/AdminService.js";

const service = new AdminService();

export const createAdmin = async (req, res, next) => {
    try {
        const { input } = req.body;
        const { data } = await service.createAdminService({ input });
        return res.json(data);
    } catch (err) {
        next(err)
    }
}

export const testGetData = async (req, res, next) => {
    try {
        const data = await service.getAllAdminSV();
        res.status(200).json(data);
    } catch (error) {
        next(error);
    }
}