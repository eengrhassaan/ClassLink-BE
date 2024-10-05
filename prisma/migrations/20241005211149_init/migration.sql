/*
  Warnings:

  - You are about to drop the column `CourseId` on the `batch` table. All the data in the column will be lost.
  - Added the required column `FKCourseId` to the `batch` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "batch" DROP CONSTRAINT "batch_CourseId_fkey";

-- AlterTable
ALTER TABLE "batch" DROP COLUMN "CourseId",
ADD COLUMN     "FKCourseId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "batch" ADD CONSTRAINT "batch_FKCourseId_fkey" FOREIGN KEY ("FKCourseId") REFERENCES "course"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
