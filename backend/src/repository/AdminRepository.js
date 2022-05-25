import { APIError, InternalError, STATUS_CODE } from "../utils/AppError.js"
import PrismaLib from '@prisma/client';


class AdminRepository {
    constructor() {
        const { PrismaClient } = PrismaLib;
        this.prisma = new PrismaClient();
    }

    async logUserSession(input) {
        const { sessionToken, adminId, userOs, userBrowser, userBrowserVersion, userDevice, accessIp, sessionExpired } = input;
        try {
            await this.prisma.archelon_session_token.create({
                data: {
                    session_token: sessionToken,
                    admin_id: adminId,
                    user_os: userOs,
                    user_browser: userBrowser,
                    user_browser_version: userBrowserVersion,
                    user_device: userDevice,
                    access_ip: accessIp,
                    session_start: new Date(),
                    last_active: new Date(),
                    session_expired: sessionExpired
                }
            })
        } catch (error) {
            throw new InternalError('DB Error', error);
        }
    }

    async addNewAdmin(input) {
        const { username, adminFullname, adminPhone = null, adminEmail = null, lastActive = null, positionId, password, adminStatusId, photoPath = '' } = input
        try {
            // DO Prisma Query
        } catch (error) {
            throw new InternalError('DB Error', error);
        }
    }

    async getAdminDetailById(adminId) {
        try {
            const data = await this.prisma.archelon_admin.findUnique({
                where: {
                    admin_id: adminId
                }
            });
            if (data.length > 0) {
                return data;
            } else {
                throw new APIError('Data not found', STATUS_CODE.NOT_FOUND, 'Admin not found');
            }
        } catch (error) {
            throw new InternalError('DB Error', error);
        }
    }

    async getAllAdmin() {
        try {
            const data = await this.prisma.archelon_admin.findMany();
            return data;
        } catch (error) {
            throw new InternalError('DB Error', error);
        }
    }

}

export default AdminRepository