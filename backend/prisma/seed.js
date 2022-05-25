import PrismaModule from '@prisma/client';
const { PrismaClient } = PrismaModule;
const prisma = new PrismaClient();

async function main() {
    await prisma.archelon_division.createMany({
        data: [
            { division_name: 'System Administrator' },
            { division_name: 'Management' }
        ]
    });
    await prisma.archelon_access_control.createMany({
        data: [
            { admin_level: 26, division_id: 1, level_title: 'Super Admin' },
            { admin_level: 5, division_id: 2, level_title: 'Owner' },
            { admin_level: 3, division_id: 2, level_title: 'Supervisor' },
            { admin_level: 1, division_id: 2, level_title: 'Staff' },
        ]
    });
    await prisma.archelon_action_category.createMany({
        data: [
            { action_category: 'Authentication' },
            { action_category: 'Admin' },
            { action_category: 'General' },
        ]
    });
    await prisma.archelon_admin_status.createMany({
        data: [
            { admin_status: 'Active' },
            { admin_status: 'Inactive' },
        ]
    });
    await prisma.archelon_config.create({
        data: { timeout_minute: 15, session_mode: 'EXCLUSIVE', login_attempt_threshold: 10, is_maintenance: false, created_at: new Date(), updated_at: new Date() }
    });
    await prisma.archelon_language.createMany({
        data: [
            { lang_code: 'en', language: 'English', currency: 'USD' },
            { lang_code: 'id', language: 'Indonesia', currency: 'IDR' }
        ]
    });
    await prisma.archelon_shift.create({
        data: { shift_name: 'Fullname', working_hour_start: new Date("2022-05-23 09:00:00"), working_hour_end: new Date("2022-05-23 20:00:00"), monday: 1, tuesday: 1, wednesday: 1, thursday: 1, friday: 1, saturday: 0, sunday: 0 }
    });
    await prisma.archelon_action.createMany({
        data: [
            { action_name: 'Login', action_code: '00-001', action_category_id: 1 },
            { action_name: 'View Dashboard', action_code: '00-002', action_category_id: 2 },
            { action_name: 'Logout', action_code: '00-003', action_category_id: 1 },
            { action_name: 'Force Logout', action_code: '00-004', action_category_id: 1 },
            { action_name: 'View Admin List', action_code: '00-005', action_category_id: 2 },
            { action_name: 'Add New Admin', action_code: '00-006', action_category_id: 2 },
            { action_name: 'View Admin Detail (Self)', action_code: '00-007', action_category_id: 2 },
            { action_name: 'View Admin Detail', action_code: '00-008', action_category_id: 2 },
            { action_name: 'Deactivate Admin', action_code: '00-009', action_category_id: 2 },
            { action_name: 'Reactivate Admin', action_code: '00-010', action_category_id: 2 },
            { action_name: 'Edit Admin Detail (Self)', action_code: '00-011', action_category_id: 2 },
            { action_name: 'Edit Admin Detail', action_code: '00-012', action_category_id: 2 },
            { action_name: 'View Gemstone Settings', action_code: '00-013', action_category_id: 3 },
            { action_name: 'Edit Gemstone Settings', action_code: '00-014', action_category_id: 3 },
            { action_name: 'View UAC Management', action_code: '00-015', action_category_id: 3 },
            { action_name: 'Add New Position', action_code: '00-016', action_category_id: 2 },
            { action_name: 'View Position Detail', action_code: '00-017', action_category_id: 2 },
            { action_name: 'Edit Position Detail', action_code: '00-018', action_category_id: 2 },
            { action_name: 'Grant Access Rule', action_code: '00-019', action_category_id: 1 },
            { action_name: 'Revoke Access Rule', action_code: '00-020', action_category_id: 1 },
            { action_name: 'Add New Division', action_code: '00-021', action_category_id: 2 },
            { action_name: 'View Division Detail', action_code: '00-022', action_category_id: 2 },
            { action_name: 'Edit Division Detail', action_code: '00-023', action_category_id: 2 },
            { action_name: 'Force Logout All User', action_code: '00-004A', action_category_id: 1 },
            { action_name: 'View UAC Table', action_code: '00-024', action_category_id: 3 },
            { action_name: 'Import UAC Table', action_code: '00-024I', action_category_id: 3 },
            { action_name: 'Download UAC Table', action_code: '00-025', action_category_id: 3 },
            { action_name: 'View DB Structure', action_code: '00-026', action_category_id: 3 },
            { action_name: 'View Admin Activity Report', action_code: '00-027', action_category_id: 2 },
            { action_name: 'Send Push Notification to Admin', action_code: '00-028', action_category_id: 2 },
            { action_name: 'View Admin Shift List', action_code: '00-029', action_category_id: 2 },
            { action_name: 'Add Admin Shift', action_code: '00-029A', action_category_id: 2 },
            { action_name: 'View Admin Shift Detail', action_code: '00-029D', action_category_id: 2 },
            { action_name: 'Edit Admin Shift', action_code: '00-029E', action_category_id: 2 },
        ]
    });
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });