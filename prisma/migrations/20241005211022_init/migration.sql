/*
  Warnings:

  - The primary key for the `batch` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `batch` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `batch` table. All the data in the column will be lost.
  - The primary key for the `course` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `course` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `course` table. All the data in the column will be lost.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `user` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[UserName]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `CourseId` to the `batch` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "batch" DROP CONSTRAINT "batch_pkey",
DROP COLUMN "id",
DROP COLUMN "isActive",
ADD COLUMN     "CourseId" INTEGER NOT NULL,
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "IsActive" BOOLEAN NOT NULL DEFAULT true,
ADD CONSTRAINT "batch_pkey" PRIMARY KEY ("Id");

-- AlterTable
ALTER TABLE "course" DROP CONSTRAINT "course_pkey",
DROP COLUMN "id",
DROP COLUMN "isActive",
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "IsActive" BOOLEAN NOT NULL DEFAULT true,
ADD CONSTRAINT "course_pkey" PRIMARY KEY ("Id");

-- AlterTable
ALTER TABLE "user" DROP CONSTRAINT "user_pkey",
DROP COLUMN "id",
DROP COLUMN "isActive",
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "IsActive" BOOLEAN NOT NULL DEFAULT true,
ADD CONSTRAINT "user_pkey" PRIMARY KEY ("Id");

-- CreateIndex
CREATE UNIQUE INDEX "user_UserName_key" ON "user"("UserName");

-- AddForeignKey
ALTER TABLE "batch" ADD CONSTRAINT "batch_CourseId_fkey" FOREIGN KEY ("CourseId") REFERENCES "course"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
