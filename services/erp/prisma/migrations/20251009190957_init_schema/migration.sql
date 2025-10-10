-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "full_name" TEXT NOT NULL,
    "email" TEXT,
    "phone_number" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" BOOLEAN NOT NULL DEFAULT false,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employees" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "salary" DECIMAL(12,2) NOT NULL,
    "role_id" INTEGER NOT NULL,

    CONSTRAINT "Employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Roles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permissions" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmployeePermissions" (
    "employee_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,

    CONSTRAINT "EmployeePermissions_pkey" PRIMARY KEY ("employee_id","permission_id")
);

-- CreateTable
CREATE TABLE "Representatives" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "note" TEXT,
    "commission_rate" DECIMAL(5,2) NOT NULL,

    CONSTRAINT "Representatives_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Suppliers" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "local_point_manager_id" INTEGER NOT NULL,
    "note" TEXT,

    CONSTRAINT "Suppliers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clients" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "local_point_manager_id" INTEGER NOT NULL,

    CONSTRAINT "Clients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Employees_user_id_key" ON "Employees"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Employees_username_key" ON "Employees"("username");

-- CreateIndex
CREATE INDEX "Employees_role_id_idx" ON "Employees"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "Representatives_user_id_key" ON "Representatives"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Suppliers_user_id_key" ON "Suppliers"("user_id");

-- CreateIndex
CREATE INDEX "Suppliers_local_point_manager_id_idx" ON "Suppliers"("local_point_manager_id");

-- CreateIndex
CREATE UNIQUE INDEX "Clients_user_id_key" ON "Clients"("user_id");

-- CreateIndex
CREATE INDEX "Clients_local_point_manager_id_idx" ON "Clients"("local_point_manager_id");

-- AddForeignKey
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employees" ADD CONSTRAINT "Employees_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeePermissions" ADD CONSTRAINT "EmployeePermissions_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeePermissions" ADD CONSTRAINT "EmployeePermissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "Permissions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representatives" ADD CONSTRAINT "Representatives_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suppliers" ADD CONSTRAINT "Suppliers_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Suppliers" ADD CONSTRAINT "Suppliers_local_point_manager_id_fkey" FOREIGN KEY ("local_point_manager_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Clients" ADD CONSTRAINT "Clients_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Clients" ADD CONSTRAINT "Clients_local_point_manager_id_fkey" FOREIGN KEY ("local_point_manager_id") REFERENCES "Employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
