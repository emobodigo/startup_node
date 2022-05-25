import AdminRepository from "../repository/AdminRepository.js";
import { FormatResponse } from '../utils/index.js'
import { APIError, InternalError } from "../utils/AppError.js";

class AdminService {
    constructor() {
        this.repository = new AdminRepository();
    }

    async createAdminService(userInputs) {
        const { data } = userInputs;
        try {
            // Do Business logic
            const newAdminId = await this.repository.addNewAdmin({});
            return FormatResponse({ id: newAdminId });
        } catch (error) {
            throw new APIError('Failed to create admin', error);
        }
    }

    async getAllAdminSV() {
        try {
            const data = await this.repository.getAllAdmin();
            return FormatResponse(data);
        } catch (err) {
            throw err;
        }
    }
}

export default AdminService;