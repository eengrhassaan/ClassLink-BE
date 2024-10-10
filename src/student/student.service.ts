import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { StudentDto } from './dto/student.dto/student.dto';

@Injectable()
export class StudentService {
    constructor(private readonly prismaService: PrismaService) {}

    // Get All Students
    async getAllStudents(){
        return this.prismaService.user.findMany()
    }

    // Get student by ID
    async getStudentById(id: number) {
        return this.prismaService.user.findUnique({
        where:{Id:id},
        });
    }

    // Create a new student
    async createStudent(studentData: StudentDto) {
        return this.prismaService.user.create({
           data: {...studentData}
        });
    }
}
